package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VerifySmsRequest {

    @NotBlank(message = "Telefonnummer darf nicht leer sein.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Ungültige tunesische Telefonnummer.")
    private String phoneNumber;

    @NotBlank(message = "OTP darf nicht leer sein.")
    @Size(min = 6, max = 6, message = "OTP muss 6 Ziffern lang sein.")
    private String otp;
}