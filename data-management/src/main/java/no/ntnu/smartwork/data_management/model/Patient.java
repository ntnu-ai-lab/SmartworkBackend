/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.LinkedHashMap;
import java.util.TreeMap;

@Getter
@Setter
@ToString(callSuper=true, includeFieldNames=true)
public class Patient {
    private String id;

    @Schema(description = "The patient's ID", example = "au675")
    private String patientId;

    @Schema(description = "The type of questionnaire", example = "baseline")
    private String questionnaireType;

    private String dateCreated;
    private String dateUpdated;

    private String status;

    private LinkedHashMap similarPatients;

    private TreeMap patientDetails;

    public Patient(){}
}



