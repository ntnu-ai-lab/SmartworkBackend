package no.ntnu.smartwork.elastic_interface.controller;

import no.ntnu.smartwork.elastic_interface.model.PatientXml;
import no.ntnu.smartwork.elastic_interface.service.patientxml.PatientXmlService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/**
        * @author: Amar Jaiswal
 */
@RestController
@RequestMapping(value= "/patientXmls")
public class PatientXmlController {
    private static final Logger LOG = LoggerFactory.getLogger(PatientXmlController.class);

    @Autowired
    PatientXmlService patientXmlService;

    /**
     * Method to save a patient xml in the database.
     * @param patientXml
     * @return
     */
    @PostMapping(value= "/savePatientXml")
    public PatientXml savePatientXml(@RequestBody PatientXml patientXml) {
        LOG.debug("PatientXML to be saved is :\n\n" + patientXml.toString() + "\n\n");

        LOG.info("Saving the patientXML in ES !!!");
        patientXml = patientXmlService.savePatientXml(patientXml);
        LOG.info("PatientXML is saved in the ES.");

        LOG.debug("Saved patientXML in ES :\n\n" + patientXml + "\n\n");

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
