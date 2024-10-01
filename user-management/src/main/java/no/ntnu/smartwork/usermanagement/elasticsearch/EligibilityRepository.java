package no.ntnu.smartwork.usermanagement.elasticsearch;

import no.ntnu.smartwork.usermanagement.db.EligibilityDocument;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Component;

@Component
public interface EligibilityRepository extends ElasticsearchRepository<EligibilityDocument, String> {
}
