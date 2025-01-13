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

    /*
    /**
     * This function takes query param to check if user is already available in eligibility repo,
     Function no longer needed since we have same link for everyone.

    @GetMapping(value = "sendFromStatus/{navID}")
    public ResponseEntity<String> sendFromStatus(@PathVariable String navID) {
        System.out.println("Recieved Nav id is : "+navID);
        // Process the incoming navID and assign a new value based on source
        if ("G1".equals(navID.trim())) {
            navID = "GP"; // Update navID to "GP"
            System.out.println("Nav id is : "+navID);
        } else if ("N0".equals(navID)) {
            navID = "NAV"; // Update navID to "NAV"
        } else if (navID == null || navID.trim().isEmpty()) {
            navID = null; // Update navID to null
        }
        if (navID == null) {
            return new ResponseEntity<>("wrong link!", HttpStatus.CONFLICT);
        } else {
            return new ResponseEntity<>("Proceed", HttpStatus.OK);
        }
    }*/

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

