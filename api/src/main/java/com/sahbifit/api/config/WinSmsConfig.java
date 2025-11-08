package com.sahbifit.api.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;

@Configuration
@ConfigurationProperties(prefix = "winsms") // Binds to winsms.api-key & winsms.base-url
@Getter
@Setter
public class WinSmsConfig {

    // These fields are automatically populated from application.properties
    private String apiKey;
    private String baseUrl;

    /**
     * Provides a RestTemplate bean for the application.
     * RestTemplate is the modern Spring way to send HTTP requests.
     */
    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        // Sets timeouts, exactly as in your example (1000ms)
        return builder
                .connectTimeout(Duration.ofMillis(1000)) // <-- UPDATED
                .readTimeout(Duration.ofMillis(1000))    // <-- UPDATED
                .build();
    }
}