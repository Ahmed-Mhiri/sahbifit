package com.sahbifit.api.external.sms;

public interface SmsService {
    void sendVerificationSms(String phoneNumber, String otp);
}