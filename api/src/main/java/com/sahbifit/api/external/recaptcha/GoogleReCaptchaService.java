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
        // Wir verwenden das RestTemplate-Bean wieder, das in WinSmsConfig erstellt wurde!
        this.restTemplate = restTemplate; 
    }

    @Override
    public void validate(String token) {
        // Google erwartet eine POST-Anfrage mit 'x-www-form-urlencoded' Daten
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("secret", reCaptchaConfig.getSecretKey());
        body.add("response", token);
        // Optional können Sie auch die IP des Benutzers mitsenden:
        // body.add("remoteip", userIp);

        ReCaptchaResponse response;
        try {
            response = restTemplate.postForObject(
                    reCaptchaConfig.getVerifyUrl(),
                    body,
                    ReCaptchaResponse.class
            );
        } catch (Exception e) {
            logger.error("Fehler bei der Kommunikation mit der Google reCAPTCHA API: {}", e.getMessage());
            // Wir werfen eine Exception, um die Registrierung zu stoppen
            throw new RuntimeException("reCAPTCHA-Dienst nicht erreichbar.");
        }

        // 1. Prüfen, ob die Anfrage selbst erfolgreich war
        if (response == null || !response.isSuccess()) {
            logger.warn("reCAPTCHA-Validierung fehlgeschlagen. Fehler: {}", 
                (response != null ? response.getErrorCodes() : "Keine Antwort"));
            throw new RuntimeException("reCAPTCHA-Validierung fehlgeschlagen.");
        }

        // 2. Prüfen, ob der Score (Bot-Wahrscheinlichkeit) ausreichend ist
        if (response.getScore() < reCaptchaConfig.getScoreThreshold()) {
            logger.warn("Potenzieller Bot blockiert. reCAPTCHA Score: {}", response.getScore());
            throw new RuntimeException("Validierung fehlgeschlagen (niedriger Score).");
        }
        
        // 3. (Optional) Sie können auch die 'action' prüfen, 
        //    um sicherzustellen, dass das Token von Ihrer Registrierungsseite stammt.
        //    z.B. if (!"register".equals(response.getAction())) { ... }

        logger.info("reCAPTCHA-Validierung erfolgreich (Score: {}).", response.getScore());
    }
}