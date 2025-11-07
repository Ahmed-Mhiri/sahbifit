package com.sahbifit.api.exception;

/**
 * Exception die ausgelöst wird, wenn ein OTP-Code abgelaufen ist.
 */
public class OtpExpiredException extends RuntimeException {

    public OtpExpiredException() {
        super();
    }

    public OtpExpiredException(String message) {
        super(message);
    }

    public OtpExpiredException(String message, Throwable cause) {
        super(message, cause);
    }

    public OtpExpiredException(Throwable cause) {
        super(cause);
    }
}