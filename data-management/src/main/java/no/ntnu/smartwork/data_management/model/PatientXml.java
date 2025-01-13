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

@Getter
@Setter
@ToString(callSuper = true, includeFieldNames = true)
public class PatientXml {

    @Schema(description = "The patient's ID", example = "au675")
    @Setter(AccessLevel.PUBLIC)
    private String patientId;

    private String dateCreated = OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN));

    @Setter(AccessLevel.PUBLIC)
    private String patientXml;

    public PatientXml(){}
}

