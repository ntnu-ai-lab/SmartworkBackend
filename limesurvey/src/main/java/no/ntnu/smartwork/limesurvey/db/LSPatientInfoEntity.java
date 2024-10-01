package no.ntnu.smartwork.limesurvey.db;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * The table with information about a patient need to create LimeSurvey participants.
 */
@Entity
@Table(name = "LSPatientInfo")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder(toBuilder = true)
public class LSPatientInfoEntity {
    @Id
    @Column(length = 20)
    private String patientId;
    private String navId;
    private String firstname;
    private String lastname;
    @Convert(converter = AttributeEncryptor.class)
    private String email;
    @Convert(converter = AttributeEncryptor.class)
    private String phone;
    private String language;
    private Boolean called;
    private String activeStatus;
    private String deactivationComment;
    @Temporal(TemporalType.TIMESTAMP)
    private Date baselineActivated;
    @Temporal(TemporalType.TIMESTAMP)
    private Date baselineCompleted;
    @Temporal(TemporalType.TIMESTAMP)
    private Date follwoup2Date;
    @Temporal(TemporalType.TIMESTAMP)
    private Date follwoup2Completed;
    @Temporal(TemporalType.TIMESTAMP)
    private Date follwoup3Date;
    @Temporal(TemporalType.TIMESTAMP)
    private Date follwoup3Completed;
    @Temporal(TemporalType.TIMESTAMP)
    private Date follwoup4Date;
    @Temporal(TemporalType.TIMESTAMP)
    private Date follwoup4Completed;
    private String PSFSAct;
    private String rctGroup = null;
}

