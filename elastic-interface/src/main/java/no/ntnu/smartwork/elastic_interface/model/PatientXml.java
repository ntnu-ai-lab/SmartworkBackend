package no.ntnu.smartwork.elastic_interface.model;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
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
import java.util.UUID;

/**
 * @author: Amar Jaiswal, Anuja VaTS
 */
@Component
@Document(indexName = "#{@environment.getProperty('elasticsearch.index.infopad.patient.xml')}") // infopad_patient_xmls - name must be lower case
@Getter
@Setter
@ToString(callSuper=true, includeFieldNames=true)
// @NoArgsConstructor
public class PatientXml {

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

    private String patientXml;

    public PatientXml(){}
}
