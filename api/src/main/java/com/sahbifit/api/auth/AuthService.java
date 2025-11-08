package com.sahbifit.api.auth;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sahbifit.api.auth.dto.AuthResponse;
import com.sahbifit.api.auth.dto.LoginRequest;
import com.sahbifit.api.auth.dto.RegisterRequest;
import com.sahbifit.api.auth.dto.ResendOtpRequest;
import com.sahbifit.api.auth.dto.VerifySmsRequest;
import com.sahbifit.api.exception.InvalidOtpException;
import com.sahbifit.api.exception.OtpExpiredException;
import com.sahbifit.api.exception.PhoneNumberAlreadyExistsException;
import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.external.recaptcha.ReCaptchaService;
import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.gym.repository.GymRepository;
import com.sahbifit.api.security.JwtTokenProvider;
import com.sahbifit.api.tag.model.Tag;
import com.sahbifit.api.tag.model.UserTag;
import com.sahbifit.api.tag.repository.TagRepository;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.model.UserRole;
import com.sahbifit.api.user.model.UserStatus;
import com.sahbifit.api.user.repository.UserRepository;
import com.sahbifit.api.verification.model.VerificationStatus;
import com.sahbifit.api.verification.model.VerifiedGender;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AuthService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtTokenProvider tokenProvider;

    @Autowired
    private ReCaptchaService reCaptchaService;

    @Autowired
    private GymRepository gymRepository;

    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Transactional
public void register(RegisterRequest request) {
    // 1. reCAPTCHA v3 validation
    reCaptchaService.validate(request.recaptchaToken());

    // 2. Tunisian number validation
    if (!isTunisianNumber(request.phoneNumber())) {
        throw new IllegalArgumentException("Invalid Tunisian phone number format.");
    }

    // 3. Check if user already exists
    if (userRepository.findByPhoneNumber(request.phoneNumber()).isPresent()) {
        throw new PhoneNumberAlreadyExistsException("Phone number is already registered.");
    }

    // 4. Create user object
    User user = new User();
    user.setPhoneNumber(request.phoneNumber());
    user.setPassword(passwordEncoder.encode(request.password()));
    user.setFirstName(request.firstName());
    user.setDateOfBirth(LocalDate.parse(request.dateOfBirth()));

    // 5. Set primary gym
    if (request.primaryGymId() != null) {
        Gym primaryGym = gymRepository.findById(request.primaryGymId())
                .orElseThrow(() -> new ResourceNotFoundException("Gym", "gymId", request.primaryGymId()));
        user.setPrimaryGym(primaryGym);
    }

    // 6. Process profile tags (Goals, Schedule) with OPTIMIZED single query
    java.util.Set<UserTag> allUserTags = new java.util.HashSet<>();

    // --- COMBINED TAG PROCESSING (Single DB Query) ---
    java.util.Set<Integer> allTagIds = new java.util.HashSet<>();
    
    if (request.goalTagIds() != null) {
        allTagIds.addAll(request.goalTagIds());
    }
    
    if (request.scheduleTagIds() != null) {
        allTagIds.addAll(request.scheduleTagIds());
    }

    if (!allTagIds.isEmpty()) {
        // SINGLE DATABASE QUERY for all tags
        java.util.List<Tag> allTags = tagRepository.findAllById(allTagIds);
        
        // Validation: Ensure all requested IDs were found
        if (allTags.size() != allTagIds.size()) {
            throw new ResourceNotFoundException("One or more tags were not found.");
        }

        // Create a map for fast lookup
        java.util.Map<Integer, Tag> tagMap = allTags.stream()
            .collect(Collectors.toMap(Tag::getTagId, tag -> tag));

        // --- Process GOAL tags from map ---
        if (request.goalTagIds() != null && !request.goalTagIds().isEmpty()) {
            java.util.Set<UserTag> goalUserTags = request.goalTagIds().stream()
                .map(tagId -> {
                    Tag tag = tagMap.get(tagId);
                    // Tag type validation
                    if (tag.getTagType() != com.sahbifit.api.tag.model.TagType.goal) {
                         throw new IllegalArgumentException("Tag " + tag.getTagName() + " is not a 'Goal' tag.");
                    }
                    UserTag userTag = new UserTag();
                    userTag.setUser(user);
                    userTag.setTag(tag);
                    return userTag;
                })
                .collect(Collectors.toSet());
            
            allUserTags.addAll(goalUserTags);
        }

        // --- Process SCHEDULE tags from map ---
        if (request.scheduleTagIds() != null && !request.scheduleTagIds().isEmpty()) {
            java.util.Set<UserTag> scheduleUserTags = request.scheduleTagIds().stream()
                .map(tagId -> {
                    Tag tag = tagMap.get(tagId);
                    // Tag type validation
                    if (tag.getTagType() != com.sahbifit.api.tag.model.TagType.schedule) {
                         throw new IllegalArgumentException("Tag " + tag.getTagName() + " is not a 'Schedule' tag.");
                    }
                    UserTag userTag = new UserTag();
                    userTag.setUser(user);
                    userTag.setTag(tag);
                    return userTag;
                })
                .collect(Collectors.toSet());

            allUserTags.addAll(scheduleUserTags);
        }
    }

    // Here we call the ONE correct set method from User.java
    user.setUserTags(allUserTags);

    // 7. Set default values (according to your specification)
    user.setRole(UserRole.member);
    user.setStatus(UserStatus.active);
    user.setVerificationStatus(VerificationStatus.not_started);
    user.setVerifiedGender(VerifiedGender.not_verified);
    user.setPhoneVerified(false);

    // 8. Save user
    userRepository.save(user);

    // 9. Publish event for async SMS sending
    try {
        eventPublisher.publishEvent(new UserRegisteredEvent(this, user));
        log.info("Successfully published UserRegisteredEvent for user {}", user.getPhoneNumber());
    } catch (Exception e) {
        // Log error but do not fail the registration
        log.error("Failed to publish UserRegisteredEvent for user {}: {}", user.getPhoneNumber(), e.getMessage());
    }
}

    public AuthResponse login(LoginRequest loginRequest) {
        // REMOVED: The manual user check and phone verification check
        // All validation will now happen in UserDetailsServiceImpl
        
        // 1. Authenticate (this will call UserDetailsServiceImpl.loadUserByUsername)
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.phoneNumber(),
                        loginRequest.password()
                )
        );

        // 2. Set Security Context
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 3. Generate JWT
        String jwt = tokenProvider.generateToken(authentication);
        return new AuthResponse(jwt);
    }

    /**
     * Verifies a user's SMS OTP code.
     */
    @Transactional
    public void verifySmsOtp(VerifySmsRequest request) {
        // 1. Find user by phone number
        User user = userRepository.findByPhoneNumber(request.phoneNumber())
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", request.phoneNumber()));

        // 2. Check if already verified
        if (user.isPhoneVerified()) {
            // No error, but no action needed.
            return; 
        }

        // 3. Check if OTP is stored
        if (user.getSmsOtp() == null || user.getSmsOtpExpiresAt() == null) {
            throw new InvalidOtpException("No pending OTP found. Please request a new one.");
        }

        // 4. Check if OTP has expired
        if (OffsetDateTime.now().isAfter(user.getSmsOtpExpiresAt())) {
            // Delete OTP to prevent reuse
            user.setSmsOtp(null);
            user.setSmsOtpExpiresAt(null);
            userRepository.save(user);
            throw new OtpExpiredException("OTP has expired. Please request a new code.");
        }

        // 5. Check if OTP code is correct
        if (!user.getSmsOtp().equals(request.otp())) {
            throw new InvalidOtpException("Invalid OTP code.");
        }

        // 6. Success! Mark user as verified
        user.setPhoneVerified(true);
        
        // 7. Clear OTP fields for security
        user.setSmsOtp(null);
        user.setSmsOtpExpiresAt(null);

        userRepository.save(user);
    }

    /**
     * Sends a new OTP code to an unverified phone number.
     * Used when the original OTP has expired.
     */
    @Transactional
    public void resendOtp(ResendOtpRequest request) {
        // 1. Validate reCAPTCHA
        reCaptchaService.validate(request.recaptchaToken());

        // 2. Tunisian number validation
        if (!isTunisianNumber(request.phoneNumber())) {
            throw new IllegalArgumentException("Invalid Tunisian phone number format.");
        }

        // 3. Find user by phone number
        User user = userRepository.findByPhoneNumber(request.phoneNumber())
                .orElseThrow(() -> new ResourceNotFoundException("User", "phoneNumber", request.phoneNumber()));

        // 4. Check if already verified
        if (user.isPhoneVerified()) {
            throw new IllegalArgumentException("Account is already verified. Please log in.");
        }

        // 5. Generate new OTP (this will be handled by AuthEventListener)
        // Note: OTP generation is now handled asynchronously by AuthEventListener
        // after UserRegisteredEvent is published
        
        // 6. Publish event for async OTP generation and SMS sending
        try {
            eventPublisher.publishEvent(new UserRegisteredEvent(this, user));
            log.info("Successfully published UserRegisteredEvent for OTP resend to user {}", user.getPhoneNumber());
        } catch (Exception e) {
            // Log error but provide a generic message to the user
            log.error("Failed to publish UserRegisteredEvent for OTP resend to user {}: {}", user.getPhoneNumber(), e.getMessage());
            throw new RuntimeException("Failed to send OTP. Please try again.");
        }
    }

    // --- Private helper methods ---

    private boolean isTunisianNumber(String phone) {
        // Implement your validation logic here
        // e.g. Regex for (2, 3, 4, 5, 7, 9) + 7 digits
        return phone != null && phone.matches("^(2|3|4|5|7|9)\\d{7}$");
    }
}