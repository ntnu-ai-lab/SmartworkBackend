package no.ntnu.smartwork.limesurvey.beans;


import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.core.JsonParser;
import lombok.Data;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Data
@JsonDeserialize(using = CustomQuestionnaireDeserializer.class)
public class CompletedQuestionnaireBean {
    /**
     * LimeSurvey tokenID
     */
    private String tid;
    /**
     * The type of the questionnaire
     */
    private String type;
    /**
     * The questionnaire itself
     */
    private Map<String, String> questionnaire;
}

class CustomQuestionnaireDeserializer extends JsonDeserializer<CompletedQuestionnaireBean> {  // Removed public
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public CompletedQuestionnaireBean deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        JsonNode node = objectMapper.readTree(p);

        CompletedQuestionnaireBean bean = new CompletedQuestionnaireBean();
        bean.setTid(node.get("tid").asText());
        bean.setType(node.get("type").asText());

        // Convert questionnaire node to Map<String, String>
        Map<String, String> questionnaire = new HashMap<>();
        JsonNode questionnaireNode = node.get("questionnaire");
        Iterator<Map.Entry<String, JsonNode>> fields = questionnaireNode.fields();
        while (fields.hasNext()) {
            Map.Entry<String, JsonNode> field = fields.next();
            questionnaire.put(field.getKey(),
                    field.getValue().isNull() ? null : field.getValue().asText());
        }
        bean.setQuestionnaire(questionnaire);

        return bean;
    }
}