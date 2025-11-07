package com.sahbifit.api.session.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Data
@Embeddable
public class SessionParticipantId implements Serializable {

    @Column(name = "session_id")
    private UUID sessionId;

    @Column(name = "user_id")
    private UUID userId;
}