package com.sahbifit.api.badge.repository;

import com.sahbifit.api.badge.model.UserBadge;
import com.sahbifit.api.badge.model.UserBadgeId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserBadgeRepository extends JpaRepository<UserBadge, UserBadgeId> {
}