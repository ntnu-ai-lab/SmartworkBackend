package no.ntnu.smartwork.elastic_interface.controller;

import no.ntnu.smartwork.elastic_interface.model.PatientXml;
import no.ntnu.smartwork.elastic_interface.service.patientxml.PatientXmlService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/**
 * @author: Amar Jaiswal, Anuja Vats
 */
@RestController
@RequestMapping(value= "/infopadPatientXmls")
public class InfopadPatientXmlController {
    private static final Logger LOG = LoggerFactory.getLogger(InfopadPatientXmlController.class);

    @Autowired
    PatientXmlService patientXmlService;

    /**
     * Method to save a patient xml in the database.
     * @param patientXml
     * @return
     */
    @PostMapping(value= "/savePatientXml")
    public PatientXml savePatientXml(@RequestBody PatientXml patientXml) {
        LOG.info("Trying to save the patient xml");
        patientXml = patientXmlService.savePatientXml(patientXml);
        LOG.info("Patient xml is save in the db");

        return patientXml;
    }

    /**
     * Method to save the patient xmls in the database.
     * @param patientXmls
     * @return
     */
    @PostMapping(value= "/saveAllPatientXmls")
    public String savePatientXmls(@RequestBody List<PatientXml> patientXmls) {
        LOG.info("Trying to save the patient xmls");
        patientXmlService.savePatientXmls(patientXmls);
        LOG.info("Patient xmls are save in the db");

        return "Patient xml saved in the db.";
    }

    /**
     * Method to fetch all patients from the database.
     * @return
     */
    @GetMapping(value= "/getAllPatientXmls")
    public Iterable<PatientXml> getAllPatientXmls() {
        LOG.info("Trying to get all the patient xmls");
        return patientXmlService.findAllPatientXmls();
    }
}