package com.sahbifit.api.external.recaptcha;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.sahbifit.api.config.ReCaptchaConfig;

@Service
public class GoogleReCaptchaService implements ReCaptchaService {

    private static final Logger logger = LoggerFactory.getLogger(GoogleReCaptchaService.class);

    private final ReCaptchaConfig reCaptchaConfig;
    private final RestTemplate restTemplate;

    @Autowired
    public GoogleReCaptchaService(ReCaptchaConfig reCaptchaConfig, RestTemplate restTemplate) {
        this.reCaptchaConfig = reCaptchaConfig;
        this.restTemplate = restTemplate; 
    }

    @Override
    public void validate(String token) {
        
        // --- START: MODIFIED LOCAL TESTING MOCK ---
        // This MUST match the token in your Flutter app
        if ("mock-token-for-local-dev".equals(token)) {
            logger.warn("====================================================");
            logger.warn(" LOCAL TESTING: reCAPTCHA validation is BYPASSED.");
            logger.warn("====================================================");
            return; // Automatically pass validation
        }
        // --- END: MODIFIED LOCAL TESTING MOCK ---

        // --- PRODUCTION CODE (UN-COMMENTED) ---
        // When in production, the token will not be the mock token,
        // so this code will execute.
        
        // Google expects a POST request with 'x-www-form-urlencoded' data
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("secret", reCaptchaConfig.getSecretKey());
        body.add("response", token);

        ReCaptchaResponse response;
        try {
            response = restTemplate.postForObject(
                    reCaptchaConfig.getVerifyUrl(),
                    body,
                    ReCaptchaResponse.class
            );
        } catch (Exception e) {
            logger.error("Error communicating with Google reCAPTCHA API: {}", e.getMessage());
            throw new RuntimeException("reCAPTCHA service unavailable.");
        }

        // 1. Check if the request itself was successful
        if (response == null || !response.isSuccess()) {
            logger.warn("reCAPTCHA validation failed. Errors: {}", 
                (response != null ? response.getErrorCodes() : "No response"));
            throw new RuntimeException("reCAPTCHA validation failed.");
        }

        // 2. Check if the score (bot probability) is sufficient
        if (response.getScore() < reCaptchaConfig.getScoreThreshold()) {
            logger.warn("Potential bot blocked. reCAPTCHA Score: {}", response.getScore());
            throw new RuntimeException("Validation failed (low score).");
        }
        
        logger.info("reCAPTCHA validation successful (Score: {}).", response.getScore());
    }
}