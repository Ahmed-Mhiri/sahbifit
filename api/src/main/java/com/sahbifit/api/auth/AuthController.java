package com.sahbifit.api.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody; // Hinzugefügter Import
import org.springframework.web.bind.annotation.RequestMapping; // Hinzugefügter Import
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.auth.dto.AuthResponse;
import com.sahbifit.api.auth.dto.LoginRequest;
import com.sahbifit.api.auth.dto.RegisterRequest;
import com.sahbifit.api.auth.dto.VerifySmsRequest;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
        AuthResponse authResponse = authService.login(loginRequest);
        return ResponseEntity.ok(authResponse);
    }

    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@Valid @RequestBody RegisterRequest registerRequest) {
        authService.register(registerRequest);
        // Aktualisierte deutsche Antwort
        return ResponseEntity.ok("Registrierung erfolgreich! Bitte prüfen Sie Ihre SMS, um Ihr Konto zu verifizieren.");
    }

    // --- NEUER ENDPUNKT ---

    /**
     * Bestätigt die Telefonnummer eines Benutzers mit dem per SMS gesendeten OTP.
     */
    @PostMapping("/verify-sms")
    public ResponseEntity<?> verifySms(@Valid @RequestBody VerifySmsRequest verifyRequest) {
        authService.verifySmsOtp(verifyRequest);
        return ResponseEntity.ok("Telefonnummer erfolgreich verifiziert. Sie können sich jetzt einloggen.");
    }
}