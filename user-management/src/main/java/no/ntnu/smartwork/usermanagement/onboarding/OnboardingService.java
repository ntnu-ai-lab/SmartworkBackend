package no.ntnu.smartwork.usermanagement.onboarding;


import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.usermanagement.controller.beans.EligibilityBean;
import no.ntnu.smartwork.usermanagement.controller.beans.EligibilityResponseBean;
import no.ntnu.smartwork.usermanagement.controller.beans.NewPatientBean;
import no.ntnu.smartwork.usermanagement.db.*;
import no.ntnu.smartwork.usermanagement.elasticsearch.EligibilityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class OnboardingService {

    @Autowired
    private EligibilityRepository eligibilityRepository;
    @Autowired
    private PatientRepository patientRepository;
    @Autowired
    private RestTemplate restTemplate;

    //@Value("${microservices.limesurvey-service.endpoints.activateNewPatient}")
    //private String activateBaselineURL;
    @Value("${microservices.limesurvey-service.endpoints.activatePatientLSInfo}")
    private String activateLSInfoURL;
    /**
     *
     * @param answers
     * @return the id of the eligibility document assigned by ES.
     */
    public EligibilityResponseBean saveEligibilityAnswers(EligibilityBean answers) {
        final EligibilityDocument eligibilityDocument = new EligibilityDocument(null, null,
                answers.getInclusionPain(),
                answers.getInclusionAge(),
                answers.getInclusionNorwegian(),
                answers.getInclusionDoctor(),
                answers.getInclusionEmployer(),
                answers.getInclusionSmartphone(),
                answers.getInclusionPregnancy(),
                answers.getInclusionSickleave());
        final EligibilityDocument savedDocument = eligibilityRepository.save(eligibilityDocument);
        return new EligibilityResponseBean(savedDocument.getId());
    }

    public void registerNewPatient(NewPatientBean newPatient) {

        final Optional<EligibilityDocument> eligibility = eligibilityRepository.findById(newPatient.getEligibilityId());
        //final List<ClinicianEntity> clinic = clinicRepository.findByClinicianID(newPatient.getClinicianId());

        log.info("search for patientID: {} , phone: {}, email: {} ", newPatient.getPatientId(), newPatient.getPhone(), newPatient.getEmail() );
        //log.info("search for clinicGroup: {} ", clinic.get(0).getRctgroup() );

        PatientEntity existingEmail = patientRepository.findByEmail(newPatient.getEmail());
        PatientEntity existingPhone = patientRepository.findByPhone(newPatient.getPhone());
        PatientEntity existingUser = patientRepository.findByPatientId(newPatient.getPatientId());


        if (!eligibility.isPresent())
            throw new IllegalStateException("No eligibility answers for this patient.");
        System.out.println("No eligibility answers for this patient");
        if (eligibility.get().getPatientId()!=null)
            throw new IllegalStateException("The patient for this eligibility answers is already registered.");
        System.out.println("This should print as patient id is available in ES");
        if (!newPatient.isConsent())
            throw new IllegalStateException("The patient must consent to participate in study to be included.");

        if (existingUser != null) {
            log.info("user exists: " + existingUser.getPatientId());
            throw new IllegalStateException("Brukernavnet er allerede registrert.");
        }
        if (patientRepository.findByEmail(newPatient.getEmail()) != null) {
            log.info("email exists: {} for user {}" , existingEmail.getEmail(), existingEmail.getPatientId());
            throw new IllegalStateException("ePost er allerede registrert.");
        }
        if (existingPhone != null) {
            log.info("phone exists: {} for user {}" , existingPhone.getPhone(), existingPhone.getPatientId());
            throw new IllegalStateException("Mobilnummer er allerede registrert.");
        }

        patientRepository.save(PatientEntity.builder()
                .patientId(newPatient.getPatientId())
                .email(newPatient.getEmail())
                .phone(newPatient.getPhone())
                .navId(newPatient.getNavId())
                .rctGroup("null")
                .build());
        final EligibilityDocument updatedEligiblity = eligibility.get().toBuilder().patientId(newPatient.getPatientId()).build();
        final EligibilityDocument savedDocument = eligibilityRepository.save(updatedEligiblity);
        activatePatientLSInfo(newPatient);
        //activateBaseline(newPatient);
    }
    public void activatePatientLSInfo(NewPatientBean newPatient){
        restTemplate.postForLocation(activateLSInfoURL, newPatient);
    }

    //public void activateBaseline(NewPatientBean newPatient){
     //   restTemplate.postForLocation(activateBaselineURL, newPatient);
    //}

    /*
    public void registerNewClinician(NewClinicianBean newClinician) {

        clinicRepository.save(ClinicianEntity.builder()
                .clinicID(newClinician.getClinicID())
                .clinicianID(newClinician.getClinicianID())
                .clinicName(newClinician.getClinicName())
                .firstname(newClinician.getFirstname())
                .lastname(newClinician.getLastname())
                .email(newClinician.getEmail())
                .rctgroup(newClinician.getRctgroup())
                .build());

    }*/

}
