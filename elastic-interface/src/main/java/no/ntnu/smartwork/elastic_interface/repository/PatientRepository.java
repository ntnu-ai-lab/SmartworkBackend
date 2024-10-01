package no.ntnu.smartwork.elastic_interface.repository;

import no.ntnu.smartwork.elastic_interface.model.Patient;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatientRepository extends ElasticsearchRepository<Patient, String> {
    //@Query("findByPatientId")
    Patient findByPatientId(String patientId);

    //@Query("findByQuestionnaireType")
    Patient findByQuestionnaireType(String questionnaireType);

}
