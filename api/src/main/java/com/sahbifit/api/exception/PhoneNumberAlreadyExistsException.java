package com.sahbifit.api.exception;

/**
 * Exception die ausgelöst wird, wenn versucht wird einen Benutzer mit einer bereits existierenden Telefonnummer zu registrieren.
 */
public class PhoneNumberAlreadyExistsException extends RuntimeException {

    public PhoneNumberAlreadyExistsException() {
        super();
    }

    public PhoneNumberAlreadyExistsException(String message) {
        super(message);
    }

    public PhoneNumberAlreadyExistsException(String message, Throwable cause) {
        super(message, cause);
    }

    public PhoneNumberAlreadyExistsException(Throwable cause) {
        super(cause);
    }
}