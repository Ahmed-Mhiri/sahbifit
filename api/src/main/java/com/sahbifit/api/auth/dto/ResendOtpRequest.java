package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResendOtpRequest {

    @NotBlank(message = "Telefonnummer darf nicht leer sein.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Ungültige tunesische Telefonnummer. (Erwartet: 8 Ziffern ohne +216)")
    private String phoneNumber;

    @NotBlank(message = "reCAPTCHA Token darf nicht leer sein.")
    private String recaptchaToken;
}