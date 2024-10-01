package no.ntnu.smartwork.elastic_interface.controller;

import no.ntnu.smartwork.elastic_interface.model.ManualPatient;
import no.ntnu.smartwork.elastic_interface.service.manualpatient.ManualPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
//TODO: Check and remove if redundant.
/**
 * @author: Amar Jaiswal, Anuja Vats
 */
@RestController
@RequestMapping(value = "/manualpatients")
public class ManualPatientController {

    @Autowired
    ManualPatientService manualPatientService;

    /**
     * Method to get a patients from the database.
     *
     * @param patientId
     * @return
     */
    @GetMapping(value = "/getManualPatientById")
    public ManualPatient getManualPatientByPid(@RequestParam String patientId) {
        return manualPatientService.findByPatientId(patientId);
    }
}

