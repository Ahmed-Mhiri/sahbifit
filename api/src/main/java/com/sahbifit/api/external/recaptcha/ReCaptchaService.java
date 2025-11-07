package com.sahbifit.api.external.recaptcha;

public interface ReCaptchaService {

    /**
     * Validates a reCAPTCHA v3 token sent from the client.
     * Throws an exception if validation fails (bot or error).
     *
     * @param token The 'response' token from the reCAPTCHA v3 client side.
     */
    void validate(String token);
}