/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.model;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.LinkedHashMap;

@Getter
@Setter
@ToString(callSuper=true, includeFieldNames=true)
// @NoArgsConstructor
public class ManualPatient {
    private String id;

    @Schema(description = "The patient's ID", example = "au675")
    private String patientId;
    private String dateCreated;
    private String dateUpdated;
    private String status;
    private LinkedHashMap similarPatients;
    private LinkedHashMap patientDetails;

    public ManualPatient(){}
}
