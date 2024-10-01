package no.ntnu.smartwork.elastic_interface.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import no.ntnu.smartwork.elastic_interface.common.Constants;
import no.ntnu.smartwork.elastic_interface.common.PatientStatus;
import no.ntnu.smartwork.elastic_interface.common.Constants;
import org.springframework.data.annotation.Id;
import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.stereotype.Component;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.TreeMap;
import java.util.UUID;

/**
 * @author: Amar Jaiswal
 */
@Component
@Document(indexName = "#{@environment.getProperty('elasticsearch.index.patient.manual.trace')}") //"manual_patient_traces") // name must be lower case
@Getter
@Setter
@ToString(callSuper=true, includeFieldNames=true)
// @NoArgsConstructor
public class ManualPatientTrace {

    // Caution with date pattern
    // https://stackoverflow.com/questions/42961507/java-time-format-datetimeparseexception-text-2016-08-30t061817698-0600-cou/42962101

    @Id
    @Setter(AccessLevel.PUBLIC)
    private String id = UUID.randomUUID().toString();

    @Schema(description="Patient ID", required = true)
    private String patientId;

    @Field(type = FieldType.Date, format = DateFormat.date, pattern = Constants.DATE_PATTERN)
    private String date = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN));

    @Field(type = FieldType.Keyword)
    private String status = PatientStatus.INITIAL.name();

    private LinkedHashMap similarPatients = new LinkedHashMap();

    private TreeMap patientDetails;

    public ManualPatientTrace(){}

    public ManualPatientTrace( String patientId, String status, LinkedHashMap similarPatients, TreeMap patientDetails) {
        this.patientId = patientId;
        this.status = status;
        this.similarPatients = similarPatients;
        this.patientDetails = patientDetails;
    }
}

