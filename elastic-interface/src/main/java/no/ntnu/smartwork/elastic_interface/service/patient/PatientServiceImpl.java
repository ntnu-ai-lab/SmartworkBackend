package no.ntnu.smartwork.elastic_interface.service.patient;

import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.elastic_interface.common.Constants;
import no.ntnu.smartwork.elastic_interface.model.Patient;
import no.ntnu.smartwork.elastic_interface.model.PatientTrace;
import no.ntnu.smartwork.elastic_interface.repository.PatientRepository;
import no.ntnu.smartwork.elastic_interface.repository.PatientTraceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class PatientServiceImpl implements PatientService {

    // The dao repository will use the Elastic-Search-Repository to perform the database operations.
    @Autowired
    private PatientRepository patientDao;

    @Autowired
    private PatientTraceRepository patientTraceDao;


    //@Autowired
    //private LSQuestionnaireRepository questionnaireRepository;

    /* (non-Javadoc)
     * @see no.ntnu.smartwork.elastic_interface.service.patient.PatientService#savePatient(java.util.List)
     */
    @Override
    public Patient savePatient(Patient patientData) {

        Patient patient = new Patient();
        String patientId = patientData.getPatientId();

        patient.setPatientId(patientId);
        patient.setQuestionnaireType(patientData.getQuestionnaireType());
        patient.setPatientDetails(patientData.getPatientDetails());


        if (null != patientData.getId()) {
            patient.setId(patientData.getId());
            patient.setDateCreated(patientData.getDateCreated());
            patient.setStatus(patientData.getStatus());
            patient.setSimilarPatients(patientData.getSimilarPatients());

        }

/*        // set the consultation time in the DB
        if (null != patientData.getId() && patientData.getQuestionnaireType() == "baseline1") {
            log.info("Setting the consultation date for {}", patientId);
            patient.setId(patientData.getId());
            patient.setDateCreated(patientData.getDateCreated());
            patient.setStatus(patientData.getStatus());
            patient.setSimilarPatients(patientData.getSimilarPatients());

            patient.setConsultationDate(patientData.getConsultationDate());
            patient.setConsultationDate(patientData.getPatientDetails().get("consultationDate").toString());

            final Optional<LSQuestionnaireEntity> questionnaireOpt = questionnaireRepository.findByPatientIdAndType(patientId, "baseline1");
            final LSQuestionnaireEntity questionnaire = questionnaireOpt.get();

            final LSQuestionnaireEntity updatedQuestionnaireInfo = questionnaire.toBuilder().consultationDate(new Date()).build();

            log.info("Saving updatedQuestionnaireInfo {} {}", updatedQuestionnaireInfo.getPatientId(), updatedQuestionnaireInfo.getConsultationDate());
            //questionnaireRepository.save(updatedQuestionnaireInfo);
        }*/

        savePatientTrace(patient);

        return patientDao.save(patient);
    }

    private void savePatientTrace(Patient patient){
        PatientTrace patientTrace = new PatientTrace(
                patient.getPatientId(),
                patient.getQuestionnaireType(),
                patient.getStatus(),
                patient.getSimilarPatients(),
                patient.getPatientDetails());
        patientTraceDao.save(patientTrace);
    }


    /* (non-Javadoc)
     * @see no.ntnu.smartwork.elastic_interface.service.patient.PatientService#savePatient(java.util.List)
     */
    @Override
    public Patient updatePatient(Patient patient) {
        patient.setDateUpdated(OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN)));

        PatientTrace patientTrace = new PatientTrace(
                patient.getPatientId(),
                patient.getQuestionnaireType(),
                patient.getStatus(),
                patient.getSimilarPatients(),
                patient.getPatientDetails());

        patientTraceDao.save(patientTrace);

        return patientDao.save(patient);
    }



    /* (non-Javadoc)
     * @see no.ntnu.smartwork.elastic_interface.service.patient.PatientService#savePatients(java.util.List)
     */
    @Override
    public Iterable<Patient> savePatients(List<Patient> patients) {
        List<PatientTrace> patientTraces = new ArrayList<>();

        for (Patient patient: patients) {
            patient.setDateUpdated(OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN)));
            PatientTrace patientTrace = new PatientTrace(
                    patient.getPatientId(),
                    patient.getQuestionnaireType(),
                    patient.getStatus(),
                    patient.getSimilarPatients(),
                    patient.getPatientDetails());
            patientTraces.add(patientTrace);
        }

        patientTraceDao.saveAll(patientTraces);

        return patientDao.saveAll(patients);
    }

    // /* (non-Javadoc)
    //  * @see no.ntnu.smartwork.elastic_interface.service.patient.PatientService#findByPatientId
    //  */
    @Override
    public Patient findByPatientId(String patientId) {
        return patientDao.findByPatientId( patientId);
    }

    @Override
    public Patient findByQuestionnaireType(String questionnaireType) {
        return patientDao.findByQuestionnaireType( questionnaireType);
    }


    /* (non-Javadoc)
     * @see no.ntnu.smartwork.elastic_interface.service.patient.PatientService#findAllPatients()
     */
    @Override
    public List<Patient> findAllPatients() {
        // Create an empty list
        List<Patient> list = new ArrayList<>();

        // Add each element of iterator to the List
        patientDao.findAll().forEach(list::add);

        return list;
    }
}

