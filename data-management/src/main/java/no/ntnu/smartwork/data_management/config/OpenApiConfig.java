/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {


    @Bean
    public OpenAPI api() {
        return new OpenAPI().info(apiInfo());
    }


    private Info apiInfo() {
        return new Info()
                .title("Data Management Service")
                .description("The service is based on spring boot and eureka. " +
                        "Multiple instances of the service are possible!")
                .version("0.1");
    }


}

