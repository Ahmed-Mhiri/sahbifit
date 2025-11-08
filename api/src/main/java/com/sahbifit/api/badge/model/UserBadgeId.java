package com.sahbifit.api.badge.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;
import java.io.Serializable;
import java.util.UUID;

@Data
@Embeddable
public class UserBadgeId implements Serializable {

    @Column(name = "user_id")
    private UUID userId;

    @Column(name = "badge_id")
    private Integer badgeId;
}