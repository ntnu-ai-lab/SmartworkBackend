package no.ntnu.smartwork.elastic_interface.repository;

import no.ntnu.smartwork.elastic_interface.model.PatientJson;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientJsonRepository extends ElasticsearchRepository<PatientJson, String> {
}

