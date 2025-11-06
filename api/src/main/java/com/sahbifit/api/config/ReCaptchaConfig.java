package com.sahbifit.api.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;

@Configuration
@ConfigurationProperties(prefix = "recaptcha") // Bindet an recaptcha.*
@Getter
@Setter
public class ReCaptchaConfig {

    private String secretKey;
    private String verifyUrl;
    private double scoreThreshold; // Wichtig für die Validierung
}