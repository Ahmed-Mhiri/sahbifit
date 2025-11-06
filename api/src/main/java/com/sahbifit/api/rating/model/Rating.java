// Pfad: src/main/java/com/sahbifit/api/rating/model/Rating.java
package com.sahbifit.api.rating.model;

import java.time.OffsetDateTime;
import java.util.UUID;

import org.hibernate.annotations.Check;
import org.hibernate.annotations.CreationTimestamp;

import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.user.model.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "ratings", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"session_id", "rating_by_user_id", "rating_for_user_id"})
}, indexes = { // <-- ADD THIS BLOCK
    @Index(name = "idx_rating_session", columnList = "session_id"),
    @Index(name = "idx_rating_rating_by", columnList = "rating_by_user_id"),
    @Index(name = "idx_rating_rating_for", columnList = "rating_for_user_id")
})
@Check(constraints = "rating_by_user_id != rating_for_user_id")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "rating_id")
    private UUID ratingId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", nullable = false)
    private Session session;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rating_by_user_id", nullable = false)
    private User ratingBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rating_for_user_id", nullable = false)
    private User ratingFor;

    @Column(name = "rating_value", nullable = false)
    private Short ratingValue; // SMALLINT entspricht Short

    @Column(name = "comment")
    private String comment;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;
}