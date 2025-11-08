package com.sahbifit.api.gym.model;

import java.time.OffsetDateTime;
import java.util.Set;
import java.util.UUID;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.annotations.Formula;
import org.hibernate.type.SqlTypes;
import org.locationtech.jts.geom.Point;

import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.user.model.User;

import jakarta.persistence.Column; 
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "gyms", indexes = { // <-- ADD "indexes" ATTRIBUTE
    @Index(name = "idx_gym_submitted_by_user", columnList = "submitted_by_user_id")
})
@SQLDelete(sql = "UPDATE gyms SET status = 'rejected' WHERE gym_id = ?") // <-- 3. ADD THIS LINE
@SQLRestriction("status != 'rejected'")
public class Gym {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "gym_id")
    private UUID gymId;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "address")
    private String address;

    @Column(name = "location", columnDefinition = "geography(Point, 4326)")
    private Point location; 
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, columnDefinition = "gym_status")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private GymStatus status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "submitted_by_user_id")
    private User submittedByUser;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private OffsetDateTime updatedAt;

    // --- NEW FIELD: MEMBER COUNT ---
    /**
     * Calculates the count of active users who have this gym
     * set as their primary gym. This is calculated at the DB level.
     */
    @Formula("(SELECT COUNT(*) FROM users u WHERE u.primary_gym_id = gym_id AND u.status = 'active')")
    private int memberCount;

    // Beziehungen zu anderen Tabellen
    @OneToMany(mappedBy = "primaryGym")
    private Set<User> users;

    @OneToMany(mappedBy = "gym")
    private Set<Session> sessions;
}