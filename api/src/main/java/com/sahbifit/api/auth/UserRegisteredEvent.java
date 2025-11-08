package com.sahbifit.api.auth;

import com.sahbifit.api.user.model.User;
import org.springframework.context.ApplicationEvent;

import lombok.Getter;

@Getter
public class UserRegisteredEvent extends ApplicationEvent {

    private final User user;

    public UserRegisteredEvent(Object source, User user) {
        super(source);
        this.user = user;
    }
}