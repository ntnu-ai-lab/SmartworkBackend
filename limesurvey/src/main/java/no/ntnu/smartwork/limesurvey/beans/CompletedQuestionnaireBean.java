package no.ntnu.smartwork.limesurvey.beans;


import lombok.Data;

import java.util.Map;

@Data
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

