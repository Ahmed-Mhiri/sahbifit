// Pfad: src/main/java/com/sahbifit/api/user/model/User.java
package com.sahbifit.api.user.model;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.Set;
import java.util.UUID;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.type.SqlTypes;

import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.model.enums.UserRole;
import com.sahbifit.api.model.enums.UserStatus;
import com.sahbifit.api.model.enums.VerificationStatus;
import com.sahbifit.api.model.enums.VerifiedGender;
import com.sahbifit.api.rating.model.Rating;
import com.sahbifit.api.report.model.Report;
import com.sahbifit.api.session.model.Session;
import com.sahbifit.api.session.model.SessionParticipant;
import com.sahbifit.api.tag.model.UserTag;

import jakarta.persistence.CascadeType;
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
@Table(name = "users", indexes = {
        @Index(name = "idx_user_primary_gym", columnList = "primary_gym_id")
})
@SQLDelete(sql = "UPDATE users SET status = 'banned', updated_at = CURRENT_TIMESTAMP WHERE user_id = ?")
@SQLRestriction("status != 'banned'")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "user_id")
    private UUID userId;

    @Column(name = "phone_number", nullable = false, unique = true, length = 20)
    private String phoneNumber;

    @Column(name = "password_hash", nullable = false)
    private String password;

    @Column(name = "is_phone_verified", nullable = false)
    @ColumnDefault("false")
    private boolean isPhoneVerified = false;

    // --- HINZUGEFÜGTE FELDER FÜR SMS OTP ---
    @Column(name = "sms_otp", length = 6)
    private String smsOtp;

    @Column(name = "sms_otp_expires_at")
    private OffsetDateTime smsOtpExpiresAt;
    // --- ENDE DER HINZUGEFÜGTEN FELDER ---

    @Column(name = "first_name", nullable = false, length = 100)
    private String firstName;

    @Column(name = "date_of_birth", nullable = false)
    private LocalDate dateOfBirth;

    @Column(name = "profile_photo_url")
    private String profilePhotoUrl;

    @Column(name = "verification_video_url")
    private String verificationVideoUrl;

    @Enumerated(EnumType.STRING)
    @Column(name = "verification_status", nullable = false, columnDefinition = "verification_status")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private VerificationStatus verificationStatus = VerificationStatus.not_started;

    @Enumerated(EnumType.STRING)
    @Column(name = "verified_gender", nullable = false, columnDefinition = "verified_gender")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private VerifiedGender verifiedGender = VerifiedGender.not_verified;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "primary_gym_id")
    private Gym primaryGym;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false, columnDefinition = "user_role")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private UserRole role;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, columnDefinition = "user_status")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private UserStatus status;

    @Column(name = "suspended_until")
    private OffsetDateTime suspendedUntil;

    @Column(name = "group_session_count", nullable = false)
    @ColumnDefault("0")
    private Integer groupSessionCount = 0;

    @Column(name = "no_show_count", nullable = false)
    @ColumnDefault("0")
    private Integer noShowCount = 0;

    @Column(name = "push_notification_token")
    private String pushNotificationToken;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private OffsetDateTime updatedAt;

    // --- Beziehungen ---

    @OneToMany(mappedBy = "submittedByUser")
    private Set<Gym> submittedGyms;

    @OneToMany(mappedBy = "creator")
    private Set<Session> createdSessions;

    @OneToMany(mappedBy = "user")
    private Set<SessionParticipant> sessionParticipations;

    @OneToMany(mappedBy = "user", cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    private Set<UserTag> userTags;

    @OneToMany(mappedBy = "ratingBy")
    private Set<Rating> givenRatings;

    @OneToMany(mappedBy = "ratingFor")
    private Set<Rating> receivedRatings;

    @OneToMany(mappedBy = "reportedBy")
    private Set<Report> filedReports;

    @OneToMany(mappedBy = "reportedUser")
    private Set<Report> receivedReports;

    @OneToMany(mappedBy = "blocker")
    private Set<UserBlock> blockedUsers;

    @OneToMany(mappedBy = "blocked")
    private Set<UserBlock> blockedByUsers;
}