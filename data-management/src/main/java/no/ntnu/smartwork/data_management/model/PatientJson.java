/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import no.ntnu.smartwork.data_management.common.Constants;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TreeMap;

@Getter
@Setter
@ToString(callSuper=true, includeFieldNames=true)
public class PatientJson {
    // Caution with date pattern
    // https://stackoverflow.com/questions/42961507/java-time-format-datetimeparseexception-text-2016-08-30t061817698-0600-cou/42962101

    @Schema(description = "The patient's ID", example = "au675")
    @Setter(AccessLevel.PUBLIC)
    private String patientId;

    @Schema(description = "The type of questionnaire", example = "baseline")
    @Setter(AccessLevel.PUBLIC)
    private String questionnaireType;

    private String dateCreated = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN));

    @Setter(AccessLevel.PUBLIC)
    private TreeMap patientJson;

    public PatientJson(){}
}
