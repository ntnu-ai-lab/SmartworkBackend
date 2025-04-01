/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.limesurvey.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.Appuser;
import no.ntnu.smartwork.limesurvey.beans.PatientJson;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoEntity;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoRepository;
import no.ntnu.smartwork.limesurvey.db.PatientEntity;
import no.ntnu.smartwork.limesurvey.db.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;

@Service
@Slf4j
public class LoginService {

    @Value("${APP_CLIENT_ID}")
    private String clientId;
    @Value("${APP_CLIENT_SECRET}")
    private String clientSecret;
    @Value("${APP_CRED_URL}")
    private String sendCredUrl;
    @Value("${APP_API_TOKEN_URI}")
    private String tokenUri;

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private LSPatientInfoRepository lsPatientInfoRepository;
    @Autowired
    private PatientRepository patientRepository;


    /**
     *Process app credentials by securely hashing the password and sending it to App-backend
     * @param user The Appuser object containing username and password
     */
    public void processAppCredentails(Appuser user) {
        // Validate the user input
        if (user.getUsername() == null || user.getPassword() == null) {
            throw new IllegalArgumentException("Username and password cannot be null");
        }

        try {
            String username = user.getUsername();

            // Find patient information using the username as patientId
            final Optional<PatientEntity> patientOpt = patientRepository.findById(username);
            final Optional<LSPatientInfoEntity> lsPatientInfoOpt = lsPatientInfoRepository.findById(username);

            if (patientOpt.isEmpty() || lsPatientInfoOpt.isEmpty()) {
                throw new IllegalArgumentException("Patient or patient info not found for ID: " + username);
            }

            final LSPatientInfoEntity patientInfo = lsPatientInfoOpt.get();
            log.info("Processing credentials for Patient ID: {}", username);

            // Hash the password for secure storage
            String hashedPassword = passwordEncoder.encode(user.getPassword());

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

            //log.info("API Token Response: {}", tokenResponse.body());
            //log.info("Map is: {}", map.toString());

            String accessToken = parseAccessToken(tokenResponse.body());

            // Prepare and send payload
            Map<String, Object> payload = new HashMap<>();
            payload.put("username", patientInfo.getPatientId());
            payload.put("password", hashedPassword);

            String jsonPayload = convertToJson(payload);

            HttpRequest dataRequest = HttpRequest.newBuilder()
                    .uri(new URI(sendCredUrl))
                    .header("Content-Type", "application/json")
                    .header("Authorization", "Bearer " + accessToken)
                    .POST(HttpRequest.BodyPublishers.ofString(jsonPayload))
                    .build();

            HttpResponse<String> dataResponse = client.send(dataRequest, HttpResponse.BodyHandlers.ofString());
            log.info("Server Response: {}", dataResponse.body());
            if (dataResponse.statusCode() >= 200 && dataResponse.statusCode() < 300) {
                log.info("Password successfully processed and sent to external backend for user: {}", username);
            } else {
                log.error("Failed to send password to external backend. Status code: {}", dataResponse.statusCode());
                throw new RuntimeException("Failed to process password. External service returned status: " + dataResponse.statusCode());
            }

        } catch (URISyntaxException e) {
            log.error("Invalid URI: {}", e.getMessage());
            throw new RuntimeException("Configuration error: Invalid URI", e);
        } catch (IOException | InterruptedException e) {
            log.error("Error during HTTP communication: {}", e.getMessage());
            throw new RuntimeException("Communication error with external service", e);
        } catch (Exception e) {
            log.error("Unexpected error: {}", e.getMessage());
            throw new RuntimeException("Failed to process credentials", e);
        }
    }

    /**
     * Extract the access token from the OAuth response
     */
    private String parseAccessToken(String responseBody) {
        String tokenPrefix = "\"access_token\":\"";
        int startIndex = responseBody.indexOf(tokenPrefix) + tokenPrefix.length();
        int endIndex = responseBody.indexOf("\"", startIndex);
        return responseBody.substring(startIndex, endIndex);
    }
    /**
     * Convert a Map to JSON string
     */
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
    /**
     * Encode form data for HTTP request
     */
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


