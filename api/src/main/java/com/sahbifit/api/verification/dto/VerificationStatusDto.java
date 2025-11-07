package com.sahbifit.api.verification.dto;

import com.sahbifit.api.model.enums.VerificationStatus;
import com.sahbifit.api.model.enums.VerifiedGender;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VerificationStatusDto {
    private VerificationStatus status;
    private VerifiedGender gender;
    
    // Standard-Konstruktor
    public VerificationStatusDto() {}
    
    // All-Args-Konstruktor
    public VerificationStatusDto(VerificationStatus status, VerifiedGender gender) {
        this.status = status;
        this.gender = gender;
    }
}