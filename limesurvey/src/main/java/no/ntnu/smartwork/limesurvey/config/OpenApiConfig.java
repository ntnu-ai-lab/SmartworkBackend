package no.ntnu.smartwork.limesurvey.config;


import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.OpenAPI;
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
                .title("Dev: Limesurvey Interface based on spring boot and eureka")
                .description("This module is specific to Limesurvey.")
                .version("0.1");
    }


}

