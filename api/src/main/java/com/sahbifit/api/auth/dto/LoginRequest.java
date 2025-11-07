package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequest {

    @NotBlank(message = "Phone number cannot be empty.")
    private String phoneNumber;

    @NotBlank(message = "Password cannot be empty.")
    private String password;
}