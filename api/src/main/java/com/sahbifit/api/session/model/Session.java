package com.sahbifit.api.session.model;

import java.time.OffsetDateTime;
import java.util.Set;
import java.util.UUID;

import org.hibernate.annotations.Check;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.type.SqlTypes;

import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.rating.model.Rating;
import com.sahbifit.api.report.model.Report;
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
@Table(name = "sessions", indexes = {
    @Index(name = "idx_session_creator_user", columnList = "creator_user_id"),
    @Index(name = "idx_session_gym", columnList = "gym_id"),
    @Index(name = "idx_session_status_type", columnList = "status, session_type"),
    @Index(name = "idx_session_time_range", columnList = "start_time, end_time"),
    // --- ADD THESE INDEXES for scheduler performance ---
    @Index(name = "idx_session_chat_activation", columnList = "is_chat_active, is_chat_processed, start_time"),
    @Index(name = "idx_session_chat_deactivation", columnList = "is_chat_active, is_chat_processed, end_time")
})
@Check(constraints = "(session_type = 'one_on_one' AND max_participants = 2) OR (session_type = 'group' AND max_participants >= 3)")
@SQLDelete(sql = "UPDATE sessions SET status = 'cancelled', updated_at = CURRENT_TIMESTAMP WHERE session_id = ?")
@SQLRestriction("status = 'active'") // <-- 2. USE THIS (instead of @Where)
public class Session {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "session_id")
    private UUID sessionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "creator_user_id", nullable = false)
    private User creator;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gym_id", nullable = false)
    private Gym gym;

    @Enumerated(EnumType.STRING)
    @Column(name = "session_type", nullable = false, columnDefinition = "session_type")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private SessionType sessionType;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, columnDefinition = "session_status")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private SessionStatus status;

    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Column(name = "start_time", nullable = false)
    private OffsetDateTime startTime;

    @Column(name = "end_time", nullable = false)
    private OffsetDateTime endTime;

    @Column(name = "max_participants", nullable = false)
    private Integer maxParticipants;

    @Column(name = "firestore_chat_id", length = 100)
    private String firestoreChatId;

    @Column(name = "is_rating_notified", nullable = false)
    @ColumnDefault("false")
    private boolean isRatingNotified = false;

    // --- NEW FIELDS FOR EPHEMERAL CHAT ---

    /**
     * Controls if the chat is currently visible to clients.
     * Managed by the ChatActivationService.
     */
    @Column(name = "is_chat_active", nullable = false)
    @ColumnDefault("false")
    private boolean isChatActive = false;

    /**
     * Prevents the scheduler from re-processing old sessions.
     * Set to true after the deactivation job runs.
     */
    @Column(name = "is_chat_processed", nullable = false)
    @ColumnDefault("false")
    private boolean isChatProcessed = false;

    // --- END OF NEW FIELDS ---

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private OffsetDateTime updatedAt;

    // --- Optimized Fields ---
    
    /**
     * Calculates participant count at the database level to avoid N+1 queries.
     * This eliminates the need to fetch all participant objects just to get a count.
     */
    @Formula("(SELECT COUNT(*) FROM session_participants sp WHERE sp.session_id = session_id AND sp.status = 'joined')")
    private int participantCount;

    @OneToMany(mappedBy = "session")
    private Set<SessionParticipant> participants;

    @OneToMany(mappedBy = "session")
    private Set<Rating> ratings;

    @OneToMany(mappedBy = "session")
    private Set<Report> reports;
}