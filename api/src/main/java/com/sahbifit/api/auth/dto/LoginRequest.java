package com.sahbifit.api.auth.dto;


import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequest {

    @NotBlank(message = "Telefonnummer darf nicht leer sein.")
    private String phoneNumber;

    @NotBlank(message = "Passwort darf nicht leer sein.")
    private String password;
}