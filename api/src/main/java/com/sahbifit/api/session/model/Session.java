// Pfad: src/main/java/com/sahbifit/api/session/model/Session.java
package com.sahbifit.api.session.model;

import java.time.OffsetDateTime;
import java.util.Set;
import java.util.UUID;

import org.hibernate.annotations.Check;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.type.SqlTypes;

import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.model.enums.SessionStatus;
import com.sahbifit.api.model.enums.SessionType;
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
@Table(name = "sessions", indexes = { // <-- ADD THIS BLOCK
    @Index(name = "idx_session_creator_user", columnList = "creator_user_id"),
    @Index(name = "idx_session_gym", columnList = "gym_id")
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

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private OffsetDateTime updatedAt;

    // --- Beziehungen ---

    @OneToMany(mappedBy = "session")
    private Set<SessionParticipant> participants;

    @OneToMany(mappedBy = "session")
    private Set<Rating> ratings;

    @OneToMany(mappedBy = "session")
    private Set<Report> reports;
}