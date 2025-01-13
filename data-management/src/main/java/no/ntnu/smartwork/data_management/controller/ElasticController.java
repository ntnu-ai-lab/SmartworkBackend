/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.controller;

import no.ntnu.smartwork.data_management.service.ElasticService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/elastic")
public class ElasticController {
    private final Log log = LogFactory.getLog(getClass());

    @Autowired
    private ElasticService elasticService;

    @GetMapping("/")
    public String health() {
        return "I am Ok!";
    }

/*    @RequestMapping("/getPatient")
    @ApiOperation(value = "${PatientController.getPatient}",//
            notes = "This API needs Infopad's projectId, journalId, and birthYear of a patient."
    )
    public String getPatientForm(
            @RequestParam(value = PROJECT_ID, required = true) String projectId,
            @RequestParam(value = JOURNAL_ID, required = true) String journalId,
            @RequestParam(value = BIRTH_YEAR, required = true) String birthYear
    ) throws JsonProcessingException {

        log.info("Fetching the patient data");
        String patient = patientDataImportService.getPatient(clinicId, clinicPassword, projectId, journalId, birthYear);
        return patient;
    }*/
}

