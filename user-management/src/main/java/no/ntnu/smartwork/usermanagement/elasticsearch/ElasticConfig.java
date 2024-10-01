package no.ntnu.smartwork.usermanagement.elasticsearch;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.elc.ElasticsearchConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;
import org.elasticsearch.client.RestClient;



@Configuration
@EnableElasticsearchRepositories(basePackages = "no.ntnu.smartwork.usermanagement")
@Slf4j
public class ElasticConfig extends ElasticsearchConfiguration {

    @Value("${elasticsearch.hosts}")
    private String[] elasticHosts;

    @Override
    public ClientConfiguration clientConfiguration() {
        return ClientConfiguration.builder()
                .connectedTo(elasticHosts) // "localhost:9200", "localhost:9201"
                .withBasicAuth("elastic", "SP2022")
                .build();
    }
}