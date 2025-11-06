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
@ConfigurationProperties(prefix = "winsms") // Bindet an winsms.api-key & winsms.base-url
@Getter
@Setter
public class WinSmsConfig {

    // Diese Felder werden automatisch aus application.properties befüllt
    private String apiKey;
    private String baseUrl;

    /**
     * Stellt ein RestTemplate-Bean für die Anwendung bereit.
     * RestTemplate ist der moderne Spring-Weg, um HTTP-Anfragen zu senden.
     */
    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        // Setzt Timeouts, genau wie in Ihrem Beispiel (1000ms)
        return builder
                .setConnectTimeout(Duration.ofMillis(1000))
                .setReadTimeout(Duration.ofMillis(1000))
                .build();
    }
}