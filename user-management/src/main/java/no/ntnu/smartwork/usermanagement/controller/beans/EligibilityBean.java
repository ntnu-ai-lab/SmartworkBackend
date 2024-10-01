package no.ntnu.smartwork.usermanagement.controller.beans;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;


/**The bean to communicate with the frontend*/
@AllArgsConstructor
@Getter
@Builder
public class EligibilityBean{
    private String InclusionPain;
    private String InclusionAge;
    private String InclusionDoctor;
    private String InclusionEmployer;
    private String InclusionNorwegian;
    private String InclusionSmartphone;
    private String InclusionPregnancy;
    private String InclusionSickleave;
}
