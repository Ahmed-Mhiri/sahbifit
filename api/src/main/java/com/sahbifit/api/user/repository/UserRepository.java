package com.sahbifit.api.user.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sahbifit.api.user.model.User;

public interface UserRepository extends JpaRepository<User, UUID> {
    
    // Diese Methode ist entscheidend für den Login
    Optional<User> findByPhoneNumber(String phoneNumber);
}