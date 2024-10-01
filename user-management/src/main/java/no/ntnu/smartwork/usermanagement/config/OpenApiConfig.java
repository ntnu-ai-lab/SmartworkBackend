package no.ntnu.smartwork.usermanagement.config;


//import io.swagger.v3.oas.annotations.info.Info;
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
                .title("User Management service")
                .description("Backend support for registering new patients.")
                .version("0.1");
    }


}
