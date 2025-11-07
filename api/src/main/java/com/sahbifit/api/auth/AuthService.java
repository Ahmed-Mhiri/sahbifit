package com.sahbifit.api.auth;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.sahbifit.api.external.sms.SmsService;
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
    private SmsService smsService;

    @Autowired
    private ReCaptchaService reCaptchaService;

    @Autowired
    private GymRepository gymRepository;

    @Autowired
    private TagRepository tagRepository;

    @Transactional
    public void register(RegisterRequest request) {
        // 1. reCAPTCHA v3 validation
        reCaptchaService.validate(request.getRecaptchaToken());

        // 2. Tunisian number validation
        if (!isTunisianNumber(request.getPhoneNumber())) {
            throw new IllegalArgumentException("Invalid Tunisian phone number format.");
        }

        // 3. Check if user already exists
        if (userRepository.findByPhoneNumber(request.getPhoneNumber()).isPresent()) {
            throw new PhoneNumberAlreadyExistsException("Phone number is already registered.");
        }

        // 4. Create user object
        User user = new User();
        user.setPhoneNumber(request.getPhoneNumber());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setFirstName(request.getFirstName());
        user.setDateOfBirth(LocalDate.parse(request.getDateOfBirth()));

        // 5. Set primary gym
        if (request.getPrimaryGymId() != null) {
            Gym primaryGym = gymRepository.findById(request.getPrimaryGymId())
                    .orElseThrow(() -> new ResourceNotFoundException("Gym not found with ID: " + request.getPrimaryGymId()));
            user.setPrimaryGym(primaryGym);
        }

        // 6. Process profile tags (Goals, Schedule) and save
        java.util.Set<UserTag> allUserTags = new java.util.HashSet<>();

        // --- Process GOAL tags (1 DB query) ---
        if (request.getGoalTagIds() != null && !request.getGoalTagIds().isEmpty()) {
            
            // 1. Get ALL Goal tags with a SINGLE database query
            java.util.List<Tag> goalTags = tagRepository.findAllById(request.getGoalTagIds());
            
            // 2. Validation: Ensure all requested IDs were found
            if (goalTags.size() != request.getGoalTagIds().size()) {
                throw new ResourceNotFoundException("One or more 'Goal' tags were not found.");
            }

            // 3. Map tags in memory (no additional DB calls)
            java.util.Set<UserTag> goalUserTags = goalTags.stream()
                .map(tag -> {
                    // Optional but recommended tag type validation
                    if (tag.getTagType() != com.sahbifit.api.tag.model.TagType.goal) {
                         throw new IllegalArgumentException("Tag " + tag.getTagName() + " is not a 'Goal' tag.");
                    }
                    UserTag userTag = new UserTag();
                    userTag.setUser(user); // Link to new user
                    userTag.setTag(tag);   // Link to found tag
                    return userTag;
                })
                .collect(Collectors.toSet());
            
            allUserTags.addAll(goalUserTags);
        }

        // --- Process SCHEDULE tags (1 DB query) ---
        if (request.getScheduleTagIds() != null && !request.getScheduleTagIds().isEmpty()) {

            // 1. Get ALL Schedule tags with a SINGLE database query
            java.util.List<Tag> scheduleTags = tagRepository.findAllById(request.getScheduleTagIds());
            
            // 2. Validation
            if (scheduleTags.size() != request.getScheduleTagIds().size()) {
                throw new ResourceNotFoundException("One or more 'Schedule' tags were not found.");
            }

            // 3. Map tags in memory (no additional DB calls)
            java.util.Set<UserTag> scheduleUserTags = scheduleTags.stream()
                .map(tag -> {
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

        // Here we call the ONE correct set method from User.java
        user.setUserTags(allUserTags);

        // 7. Set default values (according to your specification)
        user.setRole(UserRole.member);
        user.setStatus(UserStatus.active);
        user.setVerificationStatus(VerificationStatus.not_started);
        user.setVerifiedGender(VerifiedGender.not_verified);
        user.setPhoneVerified(false);

        // 8. Generate OTP (One-Time Password) for SMS
        String otp = generateOtp();
        
        // 9. Save OTP and expiration date in DB
        user.setSmsOtp(otp);
        user.setSmsOtpExpiresAt(OffsetDateTime.now().plusMinutes(10)); // 10 minutes validity
        
        // 10. Save user
        userRepository.save(user);

        // 11. Send SMS
        smsService.sendVerificationSms(user.getPhoneNumber(), otp);
    }

    public AuthResponse login(LoginRequest loginRequest) {
        // REMOVED: The manual user check and phone verification check
        // All validation will now happen in UserDetailsServiceImpl
        
        // 1. Authenticate (this will call UserDetailsServiceImpl.loadUserByUsername)
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getPhoneNumber(),
                        loginRequest.getPassword()
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
        User user = userRepository.findByPhoneNumber(request.getPhoneNumber())
                .orElseThrow(() -> new ResourceNotFoundException("User not found."));

        // 2. Check if already verified
        if (user.isPhoneVerified()) {
            // No error, but no action needed.
            return; 
        }

        // 3. Check if OTP is stored
        if (user.getSmsOtp() == null || user.getSmsOtpExpiresAt() == null) {
            throw new IllegalStateException("No pending OTP found. Please request a new one.");
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
        if (!user.getSmsOtp().equals(request.getOtp())) {
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
        reCaptchaService.validate(request.getRecaptchaToken());

        // 2. Tunisian number validation
        if (!isTunisianNumber(request.getPhoneNumber())) {
            throw new IllegalArgumentException("Invalid Tunisian phone number format.");
        }

        // 3. Find user by phone number
        User user = userRepository.findByPhoneNumber(request.getPhoneNumber())
                .orElseThrow(() -> new ResourceNotFoundException("User not found."));

        // 4. Check if already verified
        if (user.isPhoneVerified()) {
            throw new IllegalArgumentException("Account is already verified. Please log in.");
        }

        // 5. Generate new OTP
        String newOtp = generateOtp();
        
        // 6. Set new OTP and expiration date
        user.setSmsOtp(newOtp);
        user.setSmsOtpExpiresAt(OffsetDateTime.now().plusMinutes(10)); // 10 minutes validity
        
        // 7. Save user
        userRepository.save(user);

        // 8. Send SMS with new OTP
        smsService.sendVerificationSms(user.getPhoneNumber(), newOtp);
    }

    // --- Private helper methods ---

    private boolean isTunisianNumber(String phone) {
        // Implement your validation logic here
        // e.g. Regex for (2, 3, 4, 5, 7, 9) + 7 digits
        return phone != null && phone.matches("^(2|3|4|5|7|9)\\d{7}$");
    }

    private String generateOtp() {
        // Generates a 6-digit code
        return String.format("%06d", new Random().nextInt(999999));
    }
}