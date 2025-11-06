package com.sahbifit.api.auth.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor // Erstellt einen Konstruktor, der den Token annimmt
public class AuthResponse {

    private String jwtToken;

    // Optional: Sie könnten hier auch eine "gültig bis" Zeit hinzufügen
    // private String tokenType = "Bearer";
}