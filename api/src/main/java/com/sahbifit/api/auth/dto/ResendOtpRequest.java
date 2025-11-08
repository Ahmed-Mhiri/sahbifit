package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record ResendOtpRequest(
    @NotBlank(message = "Phone number cannot be empty.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Invalid Tunisian phone number. (Expected: 8 digits without +216)")
    String phoneNumber,

    @NotBlank(message = "reCAPTCHA token cannot be empty.")
    String recaptchaToken
) {}