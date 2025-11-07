package com.sahbifit.api.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * A custom exception that is thrown when a resource
 * (e.g., a user) could not be found.
 * * The @ResponseStatus annotation ensures that Spring Boot automatically
 * returns a 404 NOT FOUND HTTP status code when this exception
 * is thrown by a controller.
 */
@ResponseStatus(HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String message) {
        super(message);
    }

    public ResourceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    // +++ HERE IS THE ADDED METHOD +++
    /**
     * Creates a new ResourceNotFoundException with formatted text.
     * @param resourceName The name of the resource (e.g., "User")
     * @param fieldName The name of the field (e.g., "userId")
     * @param fieldValue The value of the field (e.g., the UUID)
     */
    public ResourceNotFoundException(String resourceName, String fieldName, Object fieldValue) {
        // Automatically formats the message, e.g.: "User not found with userId : '12345-abcde'"
        super(String.format("%s not found with %s : '%s'", resourceName, fieldName, fieldValue.toString()));
    }
    // +++ END OF NEW CODE +++
}