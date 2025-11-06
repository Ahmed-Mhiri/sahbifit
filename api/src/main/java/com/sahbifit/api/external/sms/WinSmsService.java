package com.sahbifit.api.external.sms;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.sahbifit.api.config.WinSmsConfig; // Import aus Ihrem Beispiel

@Service // Wichtig: Markiert dies als Spring-Implementierung von SmsService
public class WinSmsService implements SmsService {

    private static final Logger logger = LoggerFactory.getLogger(WinSmsService.class);

    private final WinSmsConfig winSmsConfig;
    private final RestTemplate restTemplate;

    @Autowired
    public WinSmsService(WinSmsConfig winSmsConfig, RestTemplate restTemplate) {
        this.winSmsConfig = winSmsConfig;
        this.restTemplate = restTemplate;
    }

    @Override
    public void sendVerificationSms(String phoneNumber, String otp) {
        
        // 🚨 WICHTIG: WinSMS erwartet '216' als Präfix.
        // Ihre Validierung speichert die Nummer ohne Präfix.
        String fullPhoneNumber = "216" + phoneNumber;
        
        String message = String.format("Ihr SahbiFit-Verifizierungscode lautet: %s", otp);

        try {
            // Wir bauen die URL genau wie in Ihrem Beispiel, 
            // da WinSMS möglicherweise eine spezielle URL-Kodierung erwartet.
            String params = String.format("action=send-sms&api_key=%s&to=%s&sms=%s",
                    URLEncoder.encode(winSmsConfig.getApiKey(), StandardCharsets.UTF_8),
                    URLEncoder.encode(fullPhoneNumber, StandardCharsets.UTF_8),
                    URLEncoder.encode(message, StandardCharsets.UTF_8));
            
            String fullUrl = winSmsConfig.getBaseUrl() + "?" + params;

            // Senden Sie die GET-Anfrage
            // Wir verwenden getForObject, da wir eine String-Antwort erwarten (z.B. "OK")
            String response = restTemplate.getForObject(fullUrl, String.class);

            // Antwort von WinSMS prüfen.
            if (response != null && response.contains("OK")) {
                logger.info("SMS an {} erfolgreich gesendet. (OTP: {})", fullPhoneNumber, otp);
            } else {
                // Wenn "OK" nicht in der Antwort enthalten ist, loggen wir den Fehler
                logger.warn("Fehler beim Senden der SMS an {}. API-Antwort: {}", fullPhoneNumber, response);
            }

        } catch (Exception e) {
            // Fängt alle Fehler ab (z.B. java.io.UnsupportedEncodingException oder RestClientException)
            logger.error("Fehler bei der Verbindung zur WinSMS-API: {}", e.getMessage(), e);
        }
    }
}