package com.sahbifit.api.user.model;

import java.time.OffsetDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "user_blocks", indexes = { // <-- ADD THIS BLOCK
    @Index(name = "idx_userblock_blocker", columnList = "blocker_user_id"),
    @Index(name = "idx_userblock_blocked", columnList = "blocked_user_id")
})
public class UserBlock {

    @EmbeddedId
    private UserBlockId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("blockerUserId")
    @JoinColumn(name = "blocker_user_id")
    private User blocker;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("blockedUserId")
    @JoinColumn(name = "blocked_user_id")
    private User blocked;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;
}