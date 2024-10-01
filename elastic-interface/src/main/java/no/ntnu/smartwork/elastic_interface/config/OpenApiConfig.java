package no.ntnu.smartwork.elastic_interface.config;

import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.OpenAPI;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author: Amar Jaiswal, Anuja Vats
 */
@Configuration
public class OpenApiConfig {


    @Bean
    public OpenAPI api() {
        return new OpenAPI().info(apiInfo());
    }


    private Info apiInfo() {
        return new Info()
                .title("Dev: Elastic Service based on spring boot, spring data, and eureka")
                .description("This module abstracts the internal implementation and API calls needed " +
                        "for Elasticsearch APIs")//
                .version("0.1");
    }

}
