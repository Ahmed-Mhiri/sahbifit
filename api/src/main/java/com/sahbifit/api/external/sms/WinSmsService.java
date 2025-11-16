package com.sahbifit.api.external.sms;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.sahbifit.api.config.WinSmsConfig; // Import from your example

@Service // Important: Marks this as Spring implementation of SmsService
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
        
        // --- START: LOCAL TESTING MOCK ---
        // Instead of sending an SMS, we log the OTP to the console.
        // You can read this log by running 'docker-compose logs -f api'
        logger.info("====================================================");
        logger.info(" LOCAL TESTING: SMS Verification");
        logger.info(" Phone Number: {}", phoneNumber);
        logger.info(" OTP Code: {}", otp);
        logger.info("====================================================");
        return; // Skip the rest of the method
        // --- END: LOCAL TESTING MOCK ---


        /* --- PRODUCTION CODE (DISABLED) ---
        // 🚨 IMPORTANT: WinSMS expects '216' as prefix.
        // Your validation stores the number without prefix.
        String fullPhoneNumber = "216" + phoneNumber;
        
        String message = String.format("Your SahbiFit verification code is: %s", otp);

        try {
            // We build the URL exactly like in your example,
            // since WinSMS might expect special URL encoding.
            String params = String.format("action=send-sms&api_key=%s&to=%s&sms=%s",
                    URLEncoder.encode(winSmsConfig.getApiKey(), StandardCharsets.UTF_8),
                    URLEncoder.encode(fullPhoneNumber, StandardCharsets.UTF_8),
                    URLEncoder.encode(message, StandardCharsets.UTF_8));
            
            String fullUrl = winSmsConfig.getBaseUrl() + "?" + params;

            // Send the GET request
            // We use getForObject since we expect a String response (e.g., "OK")
            String response = restTemplate.getForObject(fullUrl, String.class);

            // Check response from WinSMS.
            if (response != null && response.contains("OK")) {
                logger.info("SMS to {} sent successfully. (OTP: {})", fullPhoneNumber, otp);
            } else {
                // If "OK" is not in the response, log the error
                logger.warn("Error sending SMS to {}. API response: {}", fullPhoneNumber, response);
            }

        } catch (Exception e) {
            // Catches all errors (e.g., java.io.UnsupportedEncodingException or RestClientException)
            logger.error("Error connecting to WinSMS API: {}", e.getMessage(), e);
        }
        */
    }
}