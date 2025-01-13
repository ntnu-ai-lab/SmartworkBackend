package no.ntnu.smartwork.elastic_interface.repository;

import no.ntnu.smartwork.elastic_interface.model.CbrCase;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

/**
 * @author: Anuja Vats
 */
@Repository
public interface CbrCaseRepository extends ElasticsearchRepository<CbrCase, String> {
}
