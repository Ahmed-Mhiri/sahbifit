// Pfad: src/main/java/com/sahbifit/api/report/model/Report.java
package com.sahbifit.api.report.model;

import java.time.OffsetDateTime;
import java.util.UUID;

import org.hibernate.annotations.Check;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.type.SqlTypes;

import com.sahbifit.api.model.enums.ReportPriority;
import com.sahbifit.api.model.enums.ReportStatus;
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
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "reports", indexes = { // <-- ADD THIS BLOCK
    @Index(name = "idx_report_reported_by", columnList = "reported_by_user_id"),
    @Index(name = "idx_report_reported_user", columnList = "reported_user_id"),
    @Index(name = "idx_report_session", columnList = "session_id")
})
@Check(constraints = "reported_by_user_id != reported_user_id")
@SQLDelete(sql = "UPDATE reports SET status = 'dismissed' WHERE report_id = ?")
@SQLRestriction("status != 'dismissed'")
public class Report {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "report_id")
    private UUID reportId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reported_by_user_id", nullable = false)
    private User reportedBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reported_user_id", nullable = false)
    private User reportedUser;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id") // Nullable
    private Session session;

    @Column(name = "reason", nullable = false)
    private String reason;

    @Enumerated(EnumType.STRING)
    @Column(name = "priority", nullable = false, columnDefinition = "report_priority")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private ReportPriority priority;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, columnDefinition = "report_status")
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    private ReportStatus status;

    @Column(name = "resolution_notes")
    private String resolutionNotes;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private OffsetDateTime updatedAt;
}