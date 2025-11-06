package com.sahbifit.api.external.recaptcha;

public interface ReCaptchaService {

    /**
     * Validiert ein vom Client gesendetes reCAPTCHA v3 Token.
     * Löst eine Ausnahme aus, wenn die Validierung fehlschlägt (Bot oder Fehler).
     *
     * @param token Das 'response' Token von der reCAPTCHA v3 Client-Seite.
     */
    void validate(String token);
}