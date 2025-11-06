package com.sahbifit.api.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Eine benutzerdefinierte Exception, die ausgelöst wird, wenn eine Ressource
 * (z. B. ein Benutzer) nicht gefunden werden konnte.
 * * Die @ResponseStatus-Annotation sorgt dafür, dass Spring Boot automatisch
 * einen 404 NOT FOUND HTTP-Statuscode zurückgibt, wenn diese Exception 
 * von einem Controller geworfen wird.
 */
@ResponseStatus(HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String message) {
        super(message);
    }

    public ResourceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}