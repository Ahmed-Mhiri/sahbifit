// Pfad: src/main/java/com/sahbifit/api/gym/repository/GymRepository.java
package com.sahbifit.api.gym.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.gym.model.Gym;

@Repository
public interface GymRepository extends JpaRepository<Gym, UUID> {
    // Spring Data JPA automatically provides the findById(UUID id) method
    // which is used in your AuthService.
}