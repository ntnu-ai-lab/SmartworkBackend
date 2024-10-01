package no.ntnu.smartwork.limesurvey.beans;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.TreeMap;

/**
 * @see no.ntnu.smartwork.elastic.model.PatientJson
 */

@Getter
@Setter
@Builder
public class PatientJson {
    public static final String DATE_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX";

    private String patientId;

    @Builder.Default
    private String dateCreated = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(DATE_PATTERN));

    private String status;

    private String questionnaireType;

    private LinkedHashMap similarPatients;

    //@Builder.Default
    //private String consultationDate = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(DATE_PATTERN));

    private TreeMap patientDetails;
}

