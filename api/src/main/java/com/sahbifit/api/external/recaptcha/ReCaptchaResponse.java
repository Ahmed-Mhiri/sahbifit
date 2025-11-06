package com.sahbifit.api.external.recaptcha;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReCaptchaResponse {

    private boolean success;
    private double score;
    private String action;
    
    @JsonProperty("challenge_ts") // Maps JSON "challenge_ts" to this field
    private String challengeTs;
    
    private String hostname;
    
    @JsonProperty("error-codes") // Maps JSON "error-codes" to this field
    private List<String> errorCodes;
}