package com.sahbifit.api.user.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sahbifit.api.model.enums.VerificationStatus;
import com.sahbifit.api.user.model.User;

public interface UserRepository extends JpaRepository<User, UUID> {
    
    // Diese Methode ist entscheidend für den Login
    Optional<User> findByPhoneNumber(String phoneNumber);
    
    // Add this method to fix the first error
    List<User> findByVerificationStatus(VerificationStatus verificationStatus);
}