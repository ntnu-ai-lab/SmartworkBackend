package no.ntnu.smartwork.elastic_interface.controller;

import no.ntnu.smartwork.elastic_interface.model.Patient;
import no.ntnu.smartwork.elastic_interface.service.patient.PatientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//TODO : Merge and remove redundant functions.
/**
 * @author: Amar Jaiswal, Anuja Vats
 */
@RestController
@RequestMapping(value= "/patients")
public class PatientController {
    private static final Logger LOG = LoggerFactory.getLogger(PatientController.class);
    @Autowired
    PatientService patientService;

    /**
     * Method to get a patients from the database.
     * @param patientId
     * @return
     */
    @GetMapping(value= "/getPatientById")
    public Patient getPatientByPid(@RequestParam String patientId) {
        return patientService.findByPatientId(patientId);
    }

    /**
     * Method to get a patients from the database.
     * @param questionnaireType
     * @return
     */
    @GetMapping(value= "/getPatientByQuestionnaireType")
    public Patient getPatientByQuestionnaireType(@RequestParam(defaultValue = "baseline1") String questionnaireType) {
        return patientService.findByQuestionnaireType(questionnaireType);
    }

    /**
     * Method to get all patients from the database.
     * @return
     */
    @GetMapping(value= "/getAllPatients")
    public List<Patient> getAllPatients() {
        return patientService.findAllPatients();
    }

    /**
     * Method to get a patients from the database.
     * @param patient
     * @return
     */
    @PostMapping(value= "/savePatient")
    public Patient savePatient(@RequestBody Patient patient) {
        LOG.debug("Patient to be saved is :\n\n" + patient.toString() + "\n\n");
        LOG.info("Saving the patient in ES !!!");
        patient = patientService.savePatient(patient);
        LOG.info("Patient is saved in the ES.");
        LOG.info("Saved patient in ES :\n\n" + patient + "\n\n");

        return patient;
    }

    @GetMapping("/")
    public String health() {
        return "Elastic-interface service is okay!";
    }
}
