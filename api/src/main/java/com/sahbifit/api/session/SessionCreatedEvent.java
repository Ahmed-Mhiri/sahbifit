package com.sahbifit.api.session;

import com.sahbifit.api.session.model.Session;
import org.springframework.context.ApplicationEvent;

public class SessionCreatedEvent extends ApplicationEvent {

    private final Session session;

    public SessionCreatedEvent(Object source, Session session) {
        super(source);
        this.session = session;
    }

    public Session getSession() {
        return session;
    }
}