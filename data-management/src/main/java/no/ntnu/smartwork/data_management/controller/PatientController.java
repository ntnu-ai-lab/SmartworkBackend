/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import io.swagger.v3.oas.annotations.Operation;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.data_management.model.ManualPatient;
import no.ntnu.smartwork.data_management.model.Patient;
import no.ntnu.smartwork.data_management.model.PatientJson;
import no.ntnu.smartwork.data_management.service.ElasticService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.TreeMap;

import static no.ntnu.smartwork.data_management.common.ApiConstant .*;

@RestController
@RequestMapping("/patient")
public class PatientController {
    private final Log log = LogFactory.getLog(getClass());

    @Autowired
    private ElasticService elasticService;

    @GetMapping("/")
    public String health() {
        return "I am Ok!";
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
        Patient patient = elasticService.getPatientByPid(patientId);
        return patient;
    }

    @PostMapping(value= "/savePatient")
    @Operation(
            summary = "${PatientController.savePatient}",
            description = "This API needs a Patient json."
    )

    public Patient savePatient(@RequestBody Patient patient) throws JsonProcessingException {

        log.info("Saving the patient Json data to DB {}");

        PatientJson patientJson = new PatientJson();
        patientJson.setPatientId(patient.getPatientId());
        patientJson.setQuestionnaireType(patient.getQuestionnaireType());
        // Create a TreeMap containing all the Patient details you want to store
        TreeMap patientDetails = new TreeMap();
        patientDetails.put("id", patient.getId());
        patientDetails.put("status", patient.getStatus());
        patientDetails.put("dateUpdated", patient.getDateUpdated());
        patientDetails.put("similarPatients", patient.getSimilarPatients());
        patientDetails.put("patientDetails", patient.getPatientDetails());
        patientJson.setPatientJson(patientDetails);

        // Save PatientJson
        PatientJson savedPatientJson = elasticService.savePatientJsonToDb(patientJson);

        return patient;
    }

    //----------------------------------------------------------------------------------------------------------

}
