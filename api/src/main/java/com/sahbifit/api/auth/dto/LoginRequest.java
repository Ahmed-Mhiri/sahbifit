package com.sahbifit.api.auth.dto;

import jakarta.validation.constraints.NotBlank;

public record LoginRequest(
    @NotBlank(message = "Phone number cannot be empty.") 
    String phoneNumber,
    
    @NotBlank(message = "Password cannot be empty.") 
    String password
) {}