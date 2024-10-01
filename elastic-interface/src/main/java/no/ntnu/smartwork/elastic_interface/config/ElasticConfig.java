package no.ntnu.smartwork.elastic_interface.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.elc.ElasticsearchConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;



/**
 * @author: Amar Jaiswal, Anuja Vats
 */
@Configuration
//@EnableElasticsearchRepositories(basePackages = "no.ntnu.smartwork.elastic_interface")
public class ElasticConfig extends ElasticsearchConfiguration {
    private static final Logger LOG = LoggerFactory.getLogger(ElasticConfig.class);

    @Value("${elasticsearch.host.1}")
    private String elasticHost1;
    @Value("${elasticsearch.host.2}")
    private String elasticHost2;

    @Override
    public ClientConfiguration clientConfiguration() {
            return ClientConfiguration.builder()
                .connectedTo(elasticHost1, elasticHost2) // "localhost:9200", "localhost:9201"
                .withBasicAuth("elastic", "SP2022")
                .build();
    }

}
