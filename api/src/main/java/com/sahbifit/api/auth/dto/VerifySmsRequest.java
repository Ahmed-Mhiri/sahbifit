package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record VerifySmsRequest(
    @NotBlank(message = "Phone number cannot be empty.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Invalid Tunisian phone number.")
    String phoneNumber,

    @NotBlank(message = "OTP cannot be empty.")
    @Size(min = 6, max = 6, message = "OTP must be 6 digits long.")
    String otp
) {}