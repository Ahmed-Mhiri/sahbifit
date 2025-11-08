package com.sahbifit.api.badge.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "badges")
public class Badge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "badge_id")
    private Integer badgeId;

    @Column(name = "badge_name", nullable = false, unique = true, length = 50)
    private String badgeName; // e.g., "UNRELIABLE"

    @Column(name = "description", nullable = false)
    private String description; // e.g., "User has 3 or more no-shows."

    @Column(name = "icon_url")
    private String iconUrl; // Path to the badge icon

    @OneToMany(mappedBy = "badge")
    private Set<UserBadge> userBadges;
}