package no.ntnu.smartwork.limesurvey.beans;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;

/**
 * New patient data structure exposed by add_patient endpoint.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NewPatient {

    @jakarta.validation.constraints.NotBlank
    @Pattern(regexp = "[a-zA-Z][\\w\\-]{3,}", message = "Patient ID must be alphanumeric, -, _ with at least 4 characters")
    private String patientId;

    private String firstname;
    private String lastname;
    @Email
    private String email;
    @Pattern(regexp = "[\\d\\s\\(\\)+-]{3,20}", message = "Invalid phone number")
    private String phone;
    private String navId;
    private String language;
    //RCT group to be updated using dashboard.
    private String rctGroup;
    private String activeStatus;
    private String deactivationComment;

}