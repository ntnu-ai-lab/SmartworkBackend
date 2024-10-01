package no.ntnu.smartwork.usermanagement.onboarding;

import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.usermanagement.controller.beans.EligibilityBean;
import no.ntnu.smartwork.usermanagement.controller.beans.EligibilityResponseBean;
import no.ntnu.smartwork.usermanagement.controller.beans.NewPatientBean;
import no.ntnu.smartwork.usermanagement.db.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import jakarta.validation.Valid;
import java.util.*;

/**
 * Provides registration of new patients.
 */
@RestController
@RequestMapping(value = "/onboarding")
@Slf4j
public class OnboardingController {

    @Autowired
    private OnboardingService onboardingService;

    @Autowired
    private PatientRepository patientRepository;

    /**
     *
     * @param answers
     * @return the id of the eligibility document assigned by ES.
     */
    @PostMapping(value = "eligibility", produces = MediaType.APPLICATION_JSON_VALUE)
    public EligibilityResponseBean postEligibilityAnswers(@RequestBody EligibilityBean answers) {
        return onboardingService.saveEligibilityAnswers(answers);
    }

    /**
     * Eligibility answers must be provided earlier.
     * @see #handleValidationExceptions(MethodArgumentNotValidException)
     * @return
     */
    @PostMapping(value = "patient")
    public void postRegisterNewPatient(@Valid @RequestBody NewPatientBean newPatient) {
        onboardingService.registerNewPatient(newPatient);
    }

    /**
     * Adding clinicians to the database.
     * @see #handleValidationExceptions(MethodArgumentNotValidException)
     */
    /*
    @PostMapping(value = "clinician")
    public void postRegisterNewClinician(@Valid @RequestBody NewClinicianBean NewClinician) {
        onboardingService.registerNewClinician(NewClinician);
    }
 */
    /**
     * Getting all clinicians for one clinic froms the database.
     * @see #handleValidationExceptions(MethodArgumentNotValidException)
     * @return
     */
	/*
	@GetMapping(value = "getCliniciansByClinic/{clinicID}")
	public List<ClinicianEntity> getCliniciansByClinic(@PathVariable String clinicID) {
		List<ClinicianEntity> clinicians = clinicRepository.findByClinicID(clinicID);

		if (!clinicians.isEmpty()) {
			return clinicians;
		} else {
			throw new IllegalStateException("No clinicians for clinicID");
		}
	}*/

    @GetMapping(value = "getOnboardingStatus/{navID}")
    public ResponseEntity<String> getOnboardingStatus(@PathVariable String navID) {
        System.out.println("Recieved Nav id is : "+navID);
        PatientEntity existingPatient = patientRepository.findByNavId(navID);
        System.out.println("patient found should be Null: "+existingPatient);

        // Return a response indicating no patient found
        if (existingPatient != null) {
            //throw new IllegalStateException("User is already registered!");
            return new ResponseEntity<>("User is already registered!", HttpStatus.CONFLICT);
        } else {
            return new ResponseEntity<>("Proceed", HttpStatus.OK);
        }
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Map<String, String> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return errors;
    }
}

