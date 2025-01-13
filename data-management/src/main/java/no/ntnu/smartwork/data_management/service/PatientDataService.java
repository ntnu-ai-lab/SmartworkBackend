/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import no.ntnu.smartwork.data_management.service.mapping.MappingUtils;
import no.ntnu.smartwork.data_management.util.PatientIdGenerator;
import no.ntnu.smartwork.data_management.common.Constants;
import no.ntnu.smartwork.data_management.model.ManualPatient;
import no.ntnu.smartwork.data_management.model.Patient;
import no.ntnu.smartwork.data_management.model.PatientJson;
import no.ntnu.smartwork.data_management.model.PatientXml;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.validation.constraints.NotNull;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

@Service
public class PatientDataService {

    private final Log log = LogFactory.getLog(getClass());
    @Autowired
    private InfopadService infopadService;

    @Autowired
    private ElasticService elasticService;

    @Autowired
    private TransformerService transformerService;

    public Patient getPatient(@NotNull Integer journalId, @NotNull Integer birthYear)
            throws JsonProcessingException {

        String patientId = PatientIdGenerator.generatePid(journalId.toString(), birthYear.toString());

        Patient patientResponse = elasticService.getPatientByPid(patientId);

        if (null == patientResponse)
            patientResponse = getFetchPatientDetails(journalId, birthYear, patientId);

        return patientResponse;
    }

    private Patient getFetchPatientDetails(Integer journalId, Integer birthYear, String patientId) throws JsonProcessingException {
        Patient patientResponse;
        log.info("Delegating get patient call to InfopadService.");
        String patientXml = infopadService.getPatient(journalId, birthYear);
        log.debug("Infopad's raw patient XML : \n\n" + patientXml + "\n\n");

        // Save the original patient form xml data to the DB
        log.info("Persisting raw patient XML in ES !!! ");
        PatientXml patientXmlResponse = elasticService.savePatientXmlToDb(patientId, patientXml);
        log.debug("Persisted raw patient XML in ES : \n\n" + patientXmlResponse + "\n\n");

        log.info("Transforming raw patient XML to SupportPrim XML !!! ");
        String transformedPatientXml = transformerService.transformXmlToXml(patientXml);
        log.debug("Transformed raw patient XML to SupportPrim XML : \n\n" + transformedPatientXml + "\n\n");

        log.info("Transforming new patient XML to json !!! ");
        String transformedJson = transformerService.transformXmlToJson(transformedPatientXml);
        log.debug("Transformed new patient XML to json : \n\n" + transformedJson + "\n\n");

        PatientJson patientJson = new PatientJson();
        patientJson.setPatientId(patientId);

        Map<String, LinkedHashMap> map = new ObjectMapper().readValue(transformedJson, LinkedHashMap.class);
        log.info("map "+ map.toString());
        TreeMap patientDetails = new TreeMap(map.get("patientDetails"));

        MappingUtils.cleanDataforNumbers(patientDetails, patientDetails);
        patientDetails.put("patient_id", patientId);

        if(patientDetails.containsKey("medic_number_1"))
            patientDetails.put("medic_number_1", patientDetails.get("medic_number_1").toString());
        if(patientDetails.containsKey("medic_number_3"))
            patientDetails.put("medic_number_3", patientDetails.get("medic_number_3").toString());

        if(patientDetails.containsKey("pseq_q1_w2"))
            patientDetails.put("pseq_q1_w2", patientDetails.get("pseq_q1_w2").toString());
        if(patientDetails.containsKey("pseq_q2_w2"))
            patientDetails.put("pseq_q2_w2", patientDetails.get("pseq_q2_w2").toString());

        if(patientDetails.containsKey("body_map_1") && patientDetails.get("body_map_1").equals(""))
            patientDetails.remove("body_map_1");
        if(patientDetails.containsKey("body_map_3") && patientDetails.get("body_map_3").equals(""))
            patientDetails.remove("body_map_3");

        patientJson.setPatientJson(patientDetails);

        // Save the original patient json to the DB
        log.info("Persisting transformed patient json in ES !!! ");
        PatientJson patientJsonEsResponse = elasticService.savePatientJsonToDb(patientJson);
        log.debug("Persisted transformed patient json in ES : \n\n" + patientJsonEsResponse + "\n\n");

        if (patientDetails.containsKey("clinic_name") && patientDetails.containsKey("journal_id") && patientDetails.containsKey("birth_year")) {
            if (
                    patientDetails.get("clinic_name").equals("") || patientDetails.get("journal_id").equals("") || patientDetails.get("birth_year").equals("")
            )
                return null;
        }

        Patient patient = new Patient();
        patient.setId(null);
        patient.setPatientId(patientId);
        patient.setDateCreated(OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN)));
        patient.setStatus(null);
        patient.setSimilarPatients(null);

        log.info("Translating patient json data for SupportPrim !!!");
        TreeMap mappedPatientDetails = MappingUtils.mapPatientDetails(patientDetails);
        log.debug("Translated patient json data for SupportPrim : \n\n" + mappedPatientDetails + "\n\n");

        patient.setPatientDetails(mappedPatientDetails);

        log.info("Persisting transformed and translated patient data in ES !!!");
        patientResponse = elasticService.savePatientToDb(patient);
        log.debug("Persisted transformed and translated patient data in ES : \n\n" + patientResponse + "\n\n");

        return patientResponse;
    }


    public String getAllPatients(Integer projectId) throws JsonProcessingException {

        log.info("Delegating get patient call to InfopadService.");
        String allPatientXmls = infopadService.getAllPatients(projectId);

        String adminId =  projectId.toString();

        // Save the original patient forms data to the DB
        elasticService.savePatientXmlToDb(adminId, allPatientXmls);

        return allPatientXmls;
    }

    public Patient getPatientById(String patientId) throws JsonProcessingException {
        // get the patient data from the DB
        Patient patient = elasticService.getPatientByPid(patientId);

        return patient;
    }

    public Patient savePatient(Patient patient) throws JsonProcessingException {
        // save the patient data into the DB
        TreeMap patientDetails = patient.getPatientDetails();

        Patient patientData = elasticService.savePatientToDb(patient);
        return patientData;
    }

    public String getManualPatientById(String patientId) throws JsonProcessingException {
        // get the patient data from the DB
        String patientData = elasticService.getManualPatientById(patientId);

        return patientData;
    }

    public ManualPatient saveManualPatient(ManualPatient manualPatient) throws JsonProcessingException {
        // save the patient data into the DB
        ManualPatient patientData = elasticService.saveManualPatientToDb(manualPatient);
        return patientData;
    }
}
