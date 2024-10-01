package no.ntnu.smartwork.limesurvey.db;


import jakarta.persistence.*;
import jakarta.persistence.TemporalType;
import lombok.*;

import java.util.Date;

/**The table with information about every active or completed questionnaire.
 * One patient can have multiple questionnaires.
 */
@Entity
@Table(name = "LSQuestionnaire")
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Getter
@Builder(toBuilder = true)
public class LSQuestionnaireEntity {
    @Id
    @Column(length = 35)	//max LS token length is 35
    /**LS token id*/
    private String tokenId;
    private String surveyId;
    private String patientId;
    /**baseline1, followup2 or followup3*/
    private String type;
    @Temporal(TemporalType.TIMESTAMP)
    private Date validUntil;
    private int remindersLeft;
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastReminder;
    @Temporal(TemporalType.TIMESTAMP)
    private Date completedDate;
}

