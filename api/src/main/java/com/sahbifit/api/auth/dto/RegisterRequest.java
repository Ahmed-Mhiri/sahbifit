package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import java.util.List;
import java.util.UUID;

public record RegisterRequest(
    // --- Core Authentication ---
    @NotBlank(message = "Phone number cannot be empty.")
    @Pattern(regexp = "^(2|3|4|5|7|9)\\d{7}$", message = "Invalid Tunisian phone number. (Expected: 8 digits without +216)")
    String phoneNumber,

    @NotBlank(message = "Password cannot be empty.")
    @Size(min = 8, message = "Password must be at least 8 characters long.")
    String password,

    @NotBlank(message = "reCAPTCHA token cannot be empty.")
    String recaptchaToken,

    // --- Profile fields (as defined in PRD) ---
    @NotBlank(message = "First name cannot be empty.")
    @Size(max = 100, message = "First name cannot exceed 100 characters.")
    String firstName,

    @NotBlank(message = "Date of birth cannot be empty.")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$", message = "Date of birth must be in YYYY-MM-DD format.")
    String dateOfBirth, // Will be parsed to LocalDate in service

    @NotNull(message = "Primary gym must be selected.")
    UUID primaryGymId,

    // Optional: The URL can be added when creating the profile or later.
    String profilePhotoUrl,

    // --- Profile Tagging System ---
    // List of tag IDs (Integer) that the user has selected for their goals
    List<Integer> goalTagIds,

    // List of tag IDs (Integer) that the user has selected for their availability
    List<Integer> scheduleTagIds
) {}