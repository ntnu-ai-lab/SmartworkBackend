package no.ntnu.smartwork.limesurvey.config;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;
import java.util.Map;
import java.util.Optional;

/**
 * Maps configuration options from the spring configuration file, usually application.properties.
 */
@Configuration
@ConfigurationProperties(prefix = "limesurvey")
@Getter
@Setter
public class QuestionnaireSettings {
    /**
     * LimeSurvey remote procedure call API URL
     */
    @Value("${limesurvey.rpc_url}")
    private String rpcUrl;

    /**
     * LimeSurvey session_key timeout.
     */
    private Duration sessionTimeout;

    private Map<String, QuestionnaireConfig> questionnaires;

    /**
     * Finds the questionnaire with the start equals to 0.
     *
     * @return
     */
    public Optional<QuestionnaireConfig> getFirstQuestionnaire() {

        return questionnaires.entrySet().stream().filter(entry -> Duration.ZERO.equals(entry.getValue().getStartDay())).findFirst().map(entry -> entry.getValue());
    }

    @Data
    @NoArgsConstructor
    public static class QuestionnaireConfig {
        private String type;
        /**
         * Time moments from the day when the baseline questionnaire was submitted.
         */
        private Duration startDay;
        private String surveyId;
        /**
         * Maximum number of reminders.
         */
        private int reminderCount;

        /**
         * Interval between reminders.
         */
        private Duration reminderInterval;
        /**
         * How long the survey is valid, i.e. patients can submit their answers.
         */
        private Duration validDuration;

        public boolean isBaseline(){
            return startDay.isZero();
        }
    }
}

