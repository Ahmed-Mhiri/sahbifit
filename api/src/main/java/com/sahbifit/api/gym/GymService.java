// Pfad: src/main/java/com/sahbifit/api/gym/GymService.java
package com.sahbifit.api.gym;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.gym.dto.AdminGymDto;
import com.sahbifit.api.gym.dto.GymSubmissionDto;
import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.gym.model.GymStatus;
import com.sahbifit.api.gym.repository.GymRepository;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class GymService {

    private final GymRepository gymRepository;
    private final UserRepository userRepository;

    /**
     * (Method 1) For Users: Get all approved gyms to list in the app.
     */
    @Transactional(readOnly = true)
    public List<Gym> getApprovedGyms() {
        return gymRepository.findByStatus(GymStatus.approved);
    }

    /**
     * (Method 2) For Users: Submit a new gym for admin review.
     * (MVP 7.5)
     */
    public Gym submitGym(GymSubmissionDto dto, String userPhoneNumber) {
        User user = userRepository.findByPhoneNumber(userPhoneNumber)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        Gym gym = new Gym();
        gym.setName(dto.getName());
        gym.setAddress(dto.getAddress());
        // Note: Location (Point) is not set here per the plan
        gym.setStatus(GymStatus.pending); // Set to pending for review
        gym.setSubmittedByUser(user);

        return gymRepository.save(gym);
    }

    /**
     * (Method 3) For Admins: Create a new, pre-approved gym.
     * (MVP 7.4)
     */
    public Gym adminCreateGym(AdminGymDto dto) {
        Gym gym = new Gym();
        gym.setName(dto.getName());
        gym.setAddress(dto.getAddress());
        gym.setStatus(GymStatus.approved); // Approved immediately
        // submittedByUser is null for admin-created gyms

        return gymRepository.save(gym);
    }

    /**
     * (Method 4) For Admins: Approve a user-submitted gym.
     * (MVP 7.5)
     */
    public Gym adminApproveGym(UUID gymId) {
        Gym gym = gymRepository.findById(gymId)
                .orElseThrow(() -> new ResourceNotFoundException("Gym not found with ID: " + gymId));
        
        gym.setStatus(GymStatus.approved);
        
        return gymRepository.save(gym);
    }

    /**
     * (Method 5) For Admins: Get ALL gyms (pending, approved, rejected).
     */
    @Transactional(readOnly = true)
    public List<Gym> adminGetAllGyms() {
        return gymRepository.findAll();
    }

    /**
     * (Method 6) For Admins: Update an existing gym.
     */
    public Gym adminUpdateGym(UUID gymId, AdminGymDto dto) {
        Gym gym = gymRepository.findById(gymId)
                .orElseThrow(() -> new ResourceNotFoundException("Gym not found with ID: " + gymId));
        
        gym.setName(dto.getName());
        gym.setAddress(dto.getAddress());
        // Add any other fields from AdminGymDto here
        
        return gymRepository.save(gym);
    }

    /**
     * (Method 7) For Admins: Delete a gym (which triggers @SQLDelete -> status = 'rejected').
     */
    public void adminDeleteGym(UUID gymId) {
        // This will find the gym and trigger the @SQLDelete annotation,
        // which sets the status to 'rejected' instead of a hard delete.
        gymRepository.deleteById(gymId);
    }
}