package no.ntnu.smartwork.elastic_interface.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import no.ntnu.smartwork.elastic_interface.common.Constants;
import io.swagger.v3.oas.annotations.media.Schema;
import no.ntnu.smartwork.elastic_interface.common.PatientStatus;
import org.springframework.data.annotation.Id;
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
 * @author: Amar Jaiswal, Anuja Vats
 */
@Component
@Document(indexName = "#{@environment.getProperty('elasticsearch.index.patient.manual')}") // manual_patients - name must be lower case
@Getter
@Setter
@ToString(callSuper=true, includeFieldNames=true)
// @NoArgsConstructor
public class ManualPatient {

    // Caution with date pattern
    // https://stackoverflow.com/questions/42961507/java-time-format-datetimeparseexception-text-2016-08-30t061817698-0600-cou/42962101

    @Id
    private String id = UUID.randomUUID().toString();

    @Schema(description="Patient ID", required = true)
    private String patientId;

    @Field(type = FieldType.Date, format = DateFormat.date, pattern = Constants.DATE_PATTERN)
    private String dateCreated = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN));

    @Field(type = FieldType.Date, format = DateFormat.date, pattern = Constants.DATE_PATTERN)
    @Setter(AccessLevel.PUBLIC)
    private String dateUpdated = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN));

    @Field(type = FieldType.Keyword)
    private String status = PatientStatus.INITIAL.name();

    private LinkedHashMap similarPatients = new LinkedHashMap();

    private TreeMap patientDetails;

    public ManualPatient(){}

    //public ManualPatient( String patientId, LinkedHashMap patientDetails) {
    //    this.patientId = patientId;
    //    this.patientDetails = patientDetails;
    //}

    //public ManualPatient( String id, String patientId, LinkedHashMap patientDetails) {
    //    this( patientId, patientDetails);
    //    this.id = id;
    //}
}

