package no.ntnu.smartwork.usermanagement.controller.beans;

import io.swagger.v3.oas.annotations.Parameter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

/** The information about new patients.
 */
@Getter
@Builder(toBuilder = true)
@NoArgsConstructor
@AllArgsConstructor
public class NewPatientBean {
    @Parameter(description = "The id of the record with eligibility answers.")
    private String eligibilityId;
    @Parameter(description = "true if the consent was given")
    @AssertTrue
    private boolean consent;
    @NotBlank
    @Pattern(regexp = "[a-zA-Z][\\w\\-]{3,20}", message = "Patient ID must be alphanumeric, -, _ with at least 4 characters")
    private String patientId;
    private String firstname;
    private String lastname;
    @Email
    private String email;
    private String phone;
    private String navId;
    private String language;
    //RCT group to be updated using dashboard.
    private String rctGroup;

}
