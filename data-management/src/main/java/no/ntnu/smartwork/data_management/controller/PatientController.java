/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import io.swagger.v3.oas.annotations.Operation;
import no.ntnu.smartwork.data_management.model.ManualPatient;
import no.ntnu.smartwork.data_management.model.Patient;
import no.ntnu.smartwork.data_management.service.PatientDataService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static no.ntnu.smartwork.data_management.common.ApiConstant .*;

@RestController
@RequestMapping("/patient")
public class PatientController {
    private final Log log = LogFactory.getLog(getClass());

    @Autowired
    private PatientDataService patientDataService;

    @GetMapping("/")
    public String health() {
        return "I am Ok!";
    }


    @GetMapping(value = "/getPatient")
    @Operation(
            summary = "${PatientController.getPatient}",
            description = "This API needs Infopad's projectId, journalId, and birthYear of a patient."
    )
    public Patient getPatient(
            @RequestParam(value = JOURNAL_ID, required = true) Integer journalId,
            @RequestParam(value = BIRTH_YEAR, required = true) Integer birthYear
    ) throws JsonProcessingException {

        log.info("Fetching the patient data");
        Patient patient = patientDataService.getPatient(journalId, birthYear);
        return patient;
    }

    @GetMapping(value = "/getPatientById")
    @Operation(
            summary = "${PatientController.getPatientById}",
            description = "This API needs a patientId."
    )

    public Patient getPatientById(
            @RequestParam(value = PATIENT_ID, required = true) String patientId
    ) throws JsonProcessingException {

        log.info("Fetching the patient data");
        Patient patient = patientDataService.getPatientById(patientId);
        return patient;
    }

    @PostMapping(value= "/savePatient")
    @Operation(
            summary = "${PatientController.savePatient}",
            description = "This API needs a Patient json."
    )

    public Patient savePatient(@RequestBody Patient patient) throws JsonProcessingException {

        log.info("Saving the patient data to DB");
        patient = patientDataService.savePatient(patient);
        return patient;
    }

    //----------------------------------------------------------------------------------------------------------

    // Temporary method to get patient data directly form Elasticsearch
    @GetMapping(value = "/getManualPatientById")
    @Operation(summary = "${PatientController.getManualPatientById}",//
            description = "This API needs a patientId."
    )
    public String getManualPatientById(
            @RequestParam(value = PATIENT_ID, required = true) String patientId
    ) throws JsonProcessingException {

        log.info("Fetching the patient data");
        String patient = patientDataService.getManualPatientById(patientId);
        return patient;
    }

    // Temporary method to save patient data directly to Elasticsearch
    @PostMapping(value= "/saveManualPatient")
    @Operation(summary = "${PatientController.saveManualPatient}",//
            description = "This API needs a ManualPatient json."
    )
    public ManualPatient saveManualPatient(@RequestBody ManualPatient manualPatient) throws JsonProcessingException {

        log.info("Saving the patient data to DB");
        manualPatient = patientDataService.saveManualPatient(manualPatient);
        return manualPatient;
    }

    @GetMapping(value = "/fetchAllPatients")
    @Operation(summary = "${PatientController.fetchAllPatients}")
    public String fetchAllPatients(
            @RequestParam(value = PROJECT_ID, required = true) Integer projectId
    ) throws JsonProcessingException {

        log.info("Fetching the patient data");
        String patient = patientDataService.getAllPatients(projectId);
        return patient;
    }
}
