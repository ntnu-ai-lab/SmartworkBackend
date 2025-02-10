package no.ntnu.smartwork.limesurvey.service;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.PatientJson;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoEntity;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoRepository;
import no.ntnu.smartwork.limesurvey.db.PatientEntity;
import no.ntnu.smartwork.limesurvey.db.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest;
import java.util.*;

/**A proxy to elastic-interface.*/
@Service
@Slf4j
public class ElasticsearchService {
    @Autowired
//	@LoadBalanced
    private RestTemplate restTemplate;

    @Autowired
    private EmailService emailService;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private LSPatientInfoRepository lsPatientInfoRepository;

    // TODO  Connect to Elastic-microservice service.
    @Value("${microservices.elastic-interface.endpoints.savePatientJson}")
    private String postJsonURL;

    @Value("${elastic.save.patient.base.url}")
    private String elasticSavePatientBaseUrl;

    @Value("${ADD_USER_URL}")
    private String addUserUrl;

    @Value("${FOLLOWUP_URL}")
    private String followupUrl;

    @Value("${APP_CLIENT_ID}")
    private String clientId;

    @Value("${APP_CLIENT_SECRET}")
    private String clientSecret;

    @Value("${APP_API_TOKEN_URI}")
    private String tokenUri;

    /**
     * Here we have a control on what will be saved to Elasticsearch
     */
    public void saveQuestionnaire(String patientId, String questionnaireType, Map<String, String> answers) {
        try {
            final TreeMap<String, String> map = new TreeMap<>();
            final Optional<PatientEntity> patientOpt = patientRepository.findById(patientId);
            final Optional<LSPatientInfoEntity> lsPatientInfoOpt = lsPatientInfoRepository.findById(patientId);
            final LSPatientInfoEntity patientInfo = lsPatientInfoOpt.get();

            if (patientOpt.isEmpty() || lsPatientInfoOpt.isEmpty()) {
                throw new IllegalArgumentException("Patient or patient info not found for ID: " + patientId);
            }
            log.info("Patient ID: " + patientId);
            log.info("questionaire type: " + questionnaireType);
            log.info("answers : " + answers);
            // Add answers to the map
            map.put("questionnaireType", questionnaireType);
            answers.forEach(map::put);
            // Remove unnecessary keys
            String[] keysToRemove = {
                    "id", "lastpage", "refurl", "seed", "datestamp",
                    "startdate", "startlanguage", "submitdate", "token"
            };
            for (String key : keysToRemove) {
                map.remove(key);
            }

            // Create request payload
            final PatientJson ESrequest = PatientJson.builder()
                    .patientId(patientId)
                    .questionnaireType(questionnaireType)
                    .patientDetails(map)
                    .build();


            // Determine target URL
            String targetUrl = null;
            if (questionnaireType.toLowerCase().contains("baseline")) {
                targetUrl = addUserUrl; // "https://back-up.idi.ntnu.no/admin/adduser";
            } else if (questionnaireType.toLowerCase().contains("followup")) {
                targetUrl = followupUrl;  // "https://back-up.idi.ntnu.no/admin/followup";
            }

            if (targetUrl != null) {
                // Request OAuth token
                Map<String, String> formData = Map.of(
                        "client_id", clientId,
                        "client_secret", clientSecret
                );
                String encodedData = encodeFormData(formData);
                HttpRequest tokenRequest = HttpRequest.newBuilder()
                        .uri(new URI(tokenUri))
                        .header("Content-Type", "application/x-www-form-urlencoded")
                        .POST(HttpRequest.BodyPublishers.ofString(encodedData))
                        .build();

                HttpClient client = HttpClient.newHttpClient();
                HttpResponse<String> tokenResponse = client.send(tokenRequest, HttpResponse.BodyHandlers.ofString());

                log.info("API Token Response: {}", tokenResponse.body());
                //log.info("Map is: {}", map.toString());

                String accessToken = parseAccessToken(tokenResponse.body());

                // Prepare and send payload
                Map<String, Object> payload = new HashMap<>();
                payload.put("username", patientInfo.getPatientId());
                payload.put("language", patientInfo.getLanguage());
                payload.put("password", "123");
                payload.put("questionnaire",map);

                String jsonPayload = convertToJson(payload);
                log.info("...payload is > {}",payload);
                log.info("...JSON payload is > {}",payload);

                HttpRequest dataRequest = HttpRequest.newBuilder()
                        .uri(new URI(targetUrl))
                        .header("Content-Type", "application/json")
                        .header("Authorization", "Bearer " + accessToken)
                        .POST(HttpRequest.BodyPublishers.ofString(jsonPayload))
                        .build();

                HttpResponse<String> dataResponse = client.send(dataRequest, HttpResponse.BodyHandlers.ofString());
                log.info("Server Response: {}", dataResponse.body());
            }

            // Send to Elasticsearch
            log.info("..........Sending to ES after sending to API.................. ");
            restTemplate.postForObject(elasticSavePatientBaseUrl, ESrequest, PatientJson.class);

        } catch (URISyntaxException e) {
            log.error("Invalid URI: {}", e.getMessage());
        } catch (IOException | InterruptedException e) {
            log.error("Error during HTTP communication: {}", e.getMessage());
        } catch (Exception e) {
            log.error("Unexpected error: {}", e.getMessage());
        }
    }

    private String parseAccessToken(String responseBody) {
        String tokenPrefix = "\"access_token\":\"";
        int startIndex = responseBody.indexOf(tokenPrefix) + tokenPrefix.length();
        int endIndex = responseBody.indexOf("\"", startIndex);
        return responseBody.substring(startIndex, endIndex);
    }

    private String convertToJson(Map<String, Object> map) {
        // Use a JSON library like Jackson for robust JSON conversion
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            log.error("Failed to convert map to JSON: {}", e.getMessage());
            return "{}";
        }
    }
    private static String encodeFormData(Map<String, String> formData) throws UnsupportedEncodingException {
        StringJoiner sj = new StringJoiner("&");
        for (Map.Entry<String, String> entry : formData.entrySet()) {
            String encodedKey = URLEncoder.encode(entry.getKey(), "UTF-8");
            String encodedValue = URLEncoder.encode(entry.getValue(), "UTF-8");
            sj.add(encodedKey + "=" + encodedValue);
        }
        return sj.toString();
    }
}