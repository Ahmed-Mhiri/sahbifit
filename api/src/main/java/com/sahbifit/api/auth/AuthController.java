package com.sahbifit.api.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sahbifit.api.auth.dto.AuthResponse;
import com.sahbifit.api.auth.dto.LoginRequest;
import com.sahbifit.api.auth.dto.RegisterRequest;
import com.sahbifit.api.auth.dto.ResendOtpRequest; // NEW IMPORT
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
        // Updated English response
        return ResponseEntity.ok("Registration successful! Please check your SMS to verify your account.");
    }

    /**
     * Verifies a user's phone number with the OTP sent via SMS.
     */
    @PostMapping("/verify-sms")
    public ResponseEntity<?> verifySms(@Valid @RequestBody VerifySmsRequest verifyRequest) {
        authService.verifySmsOtp(verifyRequest);
        return ResponseEntity.ok("Phone number successfully verified. You can now log in.");
    }

    // --- NEW ENDPOINT ---

    /**
     * Sends a new OTP code to an unverified phone number.
     * Used when the original OTP has expired.
     */
    @PostMapping("/resend-otp")
    public ResponseEntity<?> resendOtp(@Valid @RequestBody ResendOtpRequest resendRequest) {
        authService.resendOtp(resendRequest);
        return ResponseEntity.ok("New verification code has been sent via SMS.");
    }
}