package no.ntnu.smartwork.elastic_interface.repository;

import no.ntnu.smartwork.elastic_interface.model.ManualPatientTrace;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManualPatientTraceRepository extends ElasticsearchRepository<ManualPatientTrace, String> {
}
