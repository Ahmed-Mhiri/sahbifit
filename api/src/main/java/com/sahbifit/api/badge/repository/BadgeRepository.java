package com.sahbifit.api.badge.repository;

import com.sahbifit.api.badge.model.Badge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface BadgeRepository extends JpaRepository<Badge, Integer> {
    Optional<Badge> findByBadgeName(String badgeName);
}