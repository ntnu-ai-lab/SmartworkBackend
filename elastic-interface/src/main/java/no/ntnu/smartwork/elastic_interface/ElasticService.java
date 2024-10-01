package no.ntnu.smartwork.elastic_interface;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author Anuja Vats
 */
@SpringBootApplication
@EnableDiscoveryClient
public class ElasticService {

	public static void main(String[] args) {
		SpringApplication.run(ElasticService.class, args);
	}

}
