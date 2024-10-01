package no.ntnu.smartwork.elastic_interface.repository;

import no.ntnu.smartwork.elastic_interface.model.ManualPatient;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: Amar Jaiswal
 */
@Repository
public interface ManualPatientRepository extends ElasticsearchRepository<ManualPatient, String> {
    //@Query("findByPatientId")
    ManualPatient findByPatientId(String patientId);



}
