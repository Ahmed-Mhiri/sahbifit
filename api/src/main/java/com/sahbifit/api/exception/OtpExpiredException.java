package com.sahbifit.api.exception;


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