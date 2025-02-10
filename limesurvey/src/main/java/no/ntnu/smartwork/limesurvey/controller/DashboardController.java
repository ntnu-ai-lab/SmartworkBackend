package no.ntnu.smartwork.limesurvey.controller;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.NewPatient;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoEntity;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoRepository;
import no.ntnu.smartwork.limesurvey.service.DashboardService;
import no.ntnu.smartwork.limesurvey.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/dashboard")
@Slf4j
public class DashboardController {
    @Autowired
    private DashboardService dashboardService;
    @Autowired
    private QuestionnaireService questionnaireService;
    @Autowired
    private LSPatientInfoRepository patientInfoRepository;

    /**
     * <ul>
     *
     * <li>Fetches all Patient Data for dashboard</li>
     * <li>Save new patient detauls in db, created from dashboard.</li>
     * <li>Activates baseline questionaire </li>
     * <li>Sets up RCT-group for each patient</li>
     *
     * </ul>
     *
     */
    @PostMapping(value = "activateLSInfo")
    public void
    activatePatientLSInfo(@Valid @RequestBody NewPatient newPatient) throws Exception {
        log.debug("Activating LSInfo record for patient {}", newPatient.getPatientId());
        patientInfoRepository.save(LSPatientInfoEntity.builder()
                .patientId(newPatient.getPatientId())
                .navId(newPatient.getNavId())
                .firstname(newPatient.getFirstname())
                .lastname(newPatient.getLastname())
                .email(newPatient.getEmail())
                .phone(newPatient.getPhone())
                .language(newPatient.getLanguage())
                .build());
        //questionnaireService.activateBaseline(newPatient);
    }

    @PostMapping(value = "activate")
    public Map<String, Object> activatePatient(@Valid @RequestBody NewPatient newPatient) throws Exception {
        log.debug("Patient Info: ", newPatient);
        System.out.println(newPatient);
        //log.debug("Activating patient {}", newPatient.getPatientId());
        Map<String, Object> response = questionnaireService.activateBaseline(newPatient);
        return response;
    }

    @GetMapping(value = "/getPatientInfo")
    public List<LSPatientInfoEntity> getAllPatientInfo() {
        return dashboardService.getAllPatientInfo();
    }


    @PostMapping(value = "/setRCTGroup")
    public void setPatientRCTGroup(@Valid @RequestBody NewPatient patient) throws Exception {
        log.info("Setting RCT group for patient: {}", patient.getPatientId());
        dashboardService.setPatientGroup(patient);
    }



    @PostMapping(value = "/deactivate")
    public void deactivatePatient(@Valid @RequestBody NewPatient patient) throws Exception {
        log.info("Deactivating Patient: {}", patient.getPatientId());
        dashboardService.deactivatePatient(patient);
    }


}


