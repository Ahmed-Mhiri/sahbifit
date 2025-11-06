package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class RegisterRequest {

    // --- Kern-Authentifizierung ---

    @NotBlank(message = "Telefonnummer darf nicht leer sein.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Ungültige tunesische Telefonnummer. (Erwartet: 8 Ziffern ohne +216)")
    private String phoneNumber;

    @NotBlank(message = "Passwort darf nicht leer sein.")
    @Size(min = 8, message = "Passwort muss mindestens 8 Zeichen lang sein.")
    private String password;

    @NotBlank(message = "reCAPTCHA Token darf nicht leer sein.")
    private String recaptchaToken;

    // --- Profilfelder (wie im PRD definiert) ---

    @NotBlank(message = "Vorname darf nicht leer sein.")
    @Size(max = 100, message = "Vorname darf maximal 100 Zeichen lang sein.")
    private String firstName;

    @NotBlank(message = "Geburtsdatum darf nicht leer sein.")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$", message = "Geburtsdatum muss im Format YYYY-MM-DD sein.")
    private String dateOfBirth; // Wird im Service zu LocalDate geparst

    @NotNull(message = "Primäres Fitnessstudio muss ausgewählt werden.")
    private UUID primaryGymId;

    // Optional: Die URL kann beim Erstellen des Profils oder später hinzugefügt werden.
    private String profilePhotoUrl; 

    // --- Profil-Tagging-System ---

    // Liste von Tag-IDs (Integer), die der Benutzer für seine Ziele ausgewählt hat
    private List<Integer> goalTagIds; 

    // Liste von Tag-IDs (Integer), die der Benutzer für seine Verfügbarkeit ausgewählt hat
    private List<Integer> scheduleTagIds;

}