package no.ntnu.smartwork.limesurvey.service;


import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.PatientJson;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoEntity;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoRepository;
import no.ntnu.smartwork.limesurvey.db.PatientEntity;
import no.ntnu.smartwork.limesurvey.db.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

/**A proxy to elastic-interface.*/
@Service
@Slf4j
public class ElasticsearchService {
    @Autowired
//	@LoadBalanced
    private RestTemplate restTemplate;

    @Autowired
    private EmailService emailService;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private LSPatientInfoRepository lsPatientInfoRepository;

    // TODO  Connect to Elastic-microservice service.
    @Value("${microservices.elastic-interface.endpoints.savePatientJson}")
    private String postJsonURL;

    @Value("${elastic.save.patient.base.url}")
    private String elasticSavePatientBaseUrl;

    /**
     * Here we have a control on what will be saved to Elasticsearch
     */
    public void saveQuestionnaire(String patientId, String questionnaireType, Map<String, String> answers)  {
        final TreeMap map = new TreeMap();
        final Optional<PatientEntity> patientOpt = patientRepository.findById(patientId);
        final Optional<LSPatientInfoEntity> lsPatientInfoOpt = lsPatientInfoRepository.findById(patientId);
        // final ClinicianEntity clinician = clinicRepository.findByClinicianID(patientOpt.get().getClinicianID());

        map.put("questionnaireType", questionnaireType);
        //map.put("clinicianId", patientOpt.get().getClinicianID());
        //map.put("clinicId", patientOpt.get().getClinicID());
        //map.put("clinicianGroup", patientOpt.get().getClinicianGroup());

        for (Map.Entry<String,String> entry : answers.entrySet())
            map.put(entry.getKey() , entry.getValue());
            System.out.println("Saving Questionaire to ES here. "+answers.entrySet());

        map.remove("id");
        map.remove("lastpage");
        map.remove("refurl");
        map.remove("seed");
        map.remove("datestamp");
        map.remove("startdate");
        map.remove("startlanguage");
        map.remove("submitdate");
        map.remove("token");
        //TODO map has all details and answers?
        /*
        log.info("LS - ESService: {}, {}, {}, {} ", patientId, patientOpt.get().getClinicID(), patientOpt.get().getClinicianID(), questionnaireType);

        if (questionnaireType.equalsIgnoreCase("baseline1")) {
            map.put("Phenotype", phenotypeService.getPhenotype(map));
        }
        */
        final PatientJson request = PatientJson.builder()
                .patientId(patientId)
                //.clinicId(patientOpt.get().getClinicID())
                //.clinicianId(patientOpt.get().getClinicianID())
                .questionnaireType(questionnaireType)
                .patientDetails(map)
                //.consultationDate("null")
                .build();


        log.info("Patient Id: {} has details in ES: {}", patientId, map);
        //log.info("LS - ESService - request consultationDate: {} ", request.getConsultationDate());

        restTemplate.postForObject(elasticSavePatientBaseUrl, request, PatientJson.class);

        // sending an e-Mail for completed baselines
        if (questionnaireType.equalsIgnoreCase("baseline1")) {
            //log.info("LS - ESService - sending email about patientId: {} to {}", patientId, clinician.getEmail());
            //emailService.sendEmail(clinician.getEmail(), patientId, lsPatientInfoOpt.get().getFirstname() + " " + lsPatientInfoOpt.get().getLastname());
        }
    }

}

