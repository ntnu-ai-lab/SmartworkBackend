package no.ntnu.smartwork.limesurvey.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.annotation.PreDestroy;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.config.QuestionnaireSettings;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Utilizes LimeSurvey RPC API.
 */
@Service
@Slf4j
public class LimesurveyService {
    @Autowired
    private QuestionnaireSettings questionnaireSettings;

    @Autowired
    public ObjectMapper objectMapper;
    public static final String METHOD_RELEASE_SESSION = "release_session_key";
    public static final String METHOD_PARTICIPANT_PROPERTIES = "get_participant_properties";
    public static final String OUTCOME_DELETED = "Deleted";
    public static final String FIELD_RESULT = "result";
    public static final String FIELD_STATUS = "status";
    public static final String ATTRIBUTE_SURVEY_TYPE = "attribute_1";
    public static final String ATTRIBUTE_SURVEY_PSFS_NAME = "attribute_2";
    public static final String FIELD_ERROR = "error";
    private String sessionKey = null;
    private Instant keyExpireDate = Instant.MIN;

    public LimesurveyService() {
        sessionKey = null;
    }

    @PreDestroy
    public void onDestroy() throws Exception {
        if (Instant.now().isBefore(keyExpireDate)) {
            log.debug("Releasing LimeSurvey session key");
            releaseSessionKey(sessionKey);
        }
    }

    /**
     * Helper method to create RPC requests to the LimeSurvey remote API.
     *
     * @param method RPC method, see https://api.limesurvey.org/classes/remotecontrol_handle.html
     * @param params an array of parameters, some elements might be objects or array themself
     * @return HttpResponse
     * @throws Exception
     */
    private HttpResponse postLime(String method, Object... params) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        // HttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(questionnaireSettings.getRpcUrl());
        post.setHeader("Content-type", "application/json");
        //post.setHeader(HTTP.CONTENT_TYPE, ContentType.APPLICATION_JSON.getMimeType());
        //post.setHeader(HTTP.CONN_DIRECTIVE, HTTP.CONN_KEEP_ALIVE);
//		RPC parameters
        Map<String, Object> map = new HashMap<>();
        map.put("method", method);
        map.put("id", 1);
        map.put("params", params);
        final String json = new ObjectMapper().writeValueAsString(map);
        //System.out.println(json);
//		logger.error(json);
        post.setEntity(new StringEntity(json, ContentType.APPLICATION_JSON));
        return httpClient.execute(post);
    }

    /**
     * This method add session key as a first parameter.
     *
     * @param method RPC method, see https://api.limesurvey.org/classes/remotecontrol_handle.html
     * @param params an array of parameters, some elements might be objects or array themself
     * @return the result field of the response
     * @throws RuntimeException if the response has "status" field.
     */
    public JsonNode call(String method, Object... params) throws Exception {
//		final ArrayList<Object> array = new ArrayList<>(params.length + 1);
//		prepending session key into the beginning
        final Object[] array = new Object[params.length + 1];
        array[0] = getSessionKey();
        System.arraycopy(params, 0, array, 1, params.length);
        final HttpResponse response = postLime(method, array);
        System.out.println(response);
        if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK)
            throw new RuntimeException(response.getStatusLine().getReasonPhrase());
        final JsonNode responseEntity = getEntityJson(response);
        if (responseEntity.hasNonNull(FIELD_ERROR))
            throw new RuntimeException(responseEntity.get(FIELD_ERROR).asText());
        final JsonNode result = responseEntity.get(FIELD_RESULT);
        final JsonNode status = result.get(FIELD_STATUS);
        System.out.println(responseEntity);
        return result;
    }

    /**
     * Returns the stored session key if it is valid or generates new session key.
     */
    public String getSessionKey() throws Exception {
        if (Instant.now().isAfter(keyExpireDate)) {
//			sessionKey = connectToLimeSurvey();
            HttpResponse response = postLime("get_session_key", "admin", "test");
            sessionKey = null;
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                sessionKey = getEntityJson(response).get(FIELD_RESULT).asText();
                keyExpireDate = Instant.now().plus(questionnaireSettings.getSessionTimeout());
                System.out.println(sessionKey);
                return sessionKey;
            } else {
                throw new AuthenticationException("Failed connecting to LimeSurvey");
            }
        }
        return sessionKey;
    }

    private JsonNode getEntityJson(HttpResponse response) throws IOException {
        HttpEntity entity = response.getEntity();
        final String content = EntityUtils.toString(entity);
        System.out.println(content);
        JsonNode rootNode = objectMapper.readTree(content);
        return rootNode;
    }

    private HttpResponse releaseSessionKey(String sessionKey) throws Exception {
        return postLime(METHOD_RELEASE_SESSION, sessionKey);
    }

}

