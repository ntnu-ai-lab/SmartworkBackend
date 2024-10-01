package no.ntnu.smartwork.elastic_interface.controller;

import no.ntnu.smartwork.elastic_interface.model.PatientJson;
import no.ntnu.smartwork.elastic_interface.service.patientjson.PatientJsonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/**
        * @author: Amar Jaiswal
 */
@RestController
@RequestMapping(value= "/patientJsons")
public class PatientJsonController {
    private static final Logger LOG = LoggerFactory.getLogger(PatientJsonController.class);

    @Autowired
    PatientJsonService patientJsonService;

    /**
     * Method to save the patient json in the database.
     * @param patientJson
     * @return
     */
    @PostMapping(value= "/savePatientJson")
    public PatientJson savePatientJson(@RequestBody PatientJson patientJson) {

        LOG.debug("PatientJson to be saved is :\n\n" + patientJson.toString() + "\n\n");

        LOG.info("Saving the patientJson in ES !!!");
        patientJson = patientJsonService.savePatientJson(patientJson);
        LOG.info("PatientJson is saved in the ES");

        LOG.debug("Saved patientJson in ES :\n\n" + patientJson + "\n\n");

        return patientJson;
    }

    /**
     * Method to save the patient jsons in the database.
     * @param patientJsons
     * @return
     */
    @PostMapping(value= "/savePatientJsons")
    public String savePatientJsons(@RequestBody List<PatientJson> patientJsons) {
        LOG.info("Trying to save the patient jsons");
        patientJsonService.savePatientJsons(patientJsons);
        LOG.info("Patient jsons are save in the data base");

        return "Patient jsons saved in the db.";
    }

    /**
     * Method to fetch all patient jsons from the database.
     * @return
     */
    @GetMapping(value= "/getAllPatientJsons")
    public Iterable<PatientJson> getAllPatientJsons() {
        LOG.info("Trying to get all the patient jsons");
        return patientJsonService.findAllPatientJsons();
    }
}
