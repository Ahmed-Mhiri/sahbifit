package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResendOtpRequest {

    @NotBlank(message = "Phone number cannot be empty.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Invalid Tunisian phone number. (Expected: 8 digits without +216)")
    private String phoneNumber;

    @NotBlank(message = "reCAPTCHA token cannot be empty.")
    private String recaptchaToken;
}