package com.sahbifit.api.auth;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.Random;
import java.util.Set;
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
import com.sahbifit.api.auth.dto.VerifySmsRequest;
import com.sahbifit.api.exception.ResourceNotFoundException;
import com.sahbifit.api.external.recaptcha.ReCaptchaService;
import com.sahbifit.api.external.sms.SmsService;
import com.sahbifit.api.gym.model.Gym;
import com.sahbifit.api.gym.repository.GymRepository;
import com.sahbifit.api.model.enums.UserRole;
import com.sahbifit.api.model.enums.UserStatus;
import com.sahbifit.api.model.enums.VerificationStatus;
import com.sahbifit.api.model.enums.VerifiedGender;
import com.sahbifit.api.security.JwtTokenProvider;
import com.sahbifit.api.tag.model.Tag;
import com.sahbifit.api.tag.repository.TagRepository;
import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;

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
        // 1. reCAPTCHA v3 Validierung
        reCaptchaService.validate(request.getRecaptchaToken());

        // 2. Tunesische Nummernvalidierung
        if (!isTunisianNumber(request.getPhoneNumber())) {
            throw new IllegalArgumentException("Ungültiges tunesisches Telefonnummernformat.");
        }

        // 3. Prüfen, ob der Benutzer bereits existiert
        if (userRepository.findByPhoneNumber(request.getPhoneNumber()).isPresent()) {
            throw new IllegalArgumentException("Telefonnummer ist bereits vergeben.");
        }

        // 4. Benutzerobjekt erstellen
        User user = new User();
        user.setPhoneNumber(request.getPhoneNumber());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setFirstName(request.getFirstName());
        user.setDateOfBirth(LocalDate.parse(request.getDateOfBirth()));

        // 5. Primary Gym setzen
        if (request.getPrimaryGymId() != null) {
            Gym primaryGym = gymRepository.findById(request.getPrimaryGymId())
                    .orElseThrow(() -> new ResourceNotFoundException("Gym nicht gefunden mit ID: " + request.getPrimaryGymId()));
            user.setPrimaryGym(primaryGym);
        }

        // 6. Profil-Tags (Goals, Schedule) verarbeiten und speichern
        if (request.getGoalTagIds() != null && !request.getGoalTagIds().isEmpty()) {
            Set<Tag> goalTags = request.getGoalTagIds().stream()
                    .map(tagId -> tagRepository.findById(tagId)
                            .orElseThrow(() -> new ResourceNotFoundException("Tag nicht gefunden mit ID: " + tagId)))
                    .collect(Collectors.toSet());
            user.setGoals(goalTags);
        }

        if (request.getScheduleTagIds() != null && !request.getScheduleTagIds().isEmpty()) {
            Set<Tag> scheduleTags = request.getScheduleTagIds().stream()
                    .map(tagId -> tagRepository.findById(tagId)
                            .orElseThrow(() -> new ResourceNotFoundException("Tag nicht gefunden mit ID: " + tagId)))
                    .collect(Collectors.toSet());
            user.setSchedule(scheduleTags);
        }

        // 7. Standardwerte setzen (gemäß Ihrer Spezifikation)
        user.setRole(UserRole.member);
        user.setStatus(UserStatus.active);
        user.setVerificationStatus(VerificationStatus.not_started);
        user.setVerifiedGender(VerifiedGender.not_verified);
        user.setPhoneVerified(false);

        // 8. OTP (One-Time Password) für SMS generieren
        String otp = generateOtp();
        
        // 9. OTP und Ablaufdatum in der DB speichern
        user.setSmsOtp(otp);
        user.setSmsOtpExpiresAt(OffsetDateTime.now().plusMinutes(10)); // 10 Minuten Gültigkeit
        
        // 10. Benutzer speichern
        userRepository.save(user);

        // 11. SMS senden
        smsService.sendVerificationSms(user.getPhoneNumber(), otp);
    }

    public AuthResponse login(LoginRequest loginRequest) {
        // 1. Authentifizieren
        // Dies löst UserDetailsServiceImpl.loadUserByUsername aus
        // und prüft, ob isPhoneVerified = true ist.
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getPhoneNumber(),
                        loginRequest.getPassword()
                )
        );

        // 2. Security Context setzen
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 3. JWT generieren
        String jwt = tokenProvider.generateToken(authentication);
        return new AuthResponse(jwt);
    }

    /**
     * Verifiziert den SMS-OTP-Code eines Benutzers.
     */
    @Transactional
    public void verifySmsOtp(VerifySmsRequest request) {
        // 1. Benutzer anhand der Telefonnummer finden
        User user = userRepository.findByPhoneNumber(request.getPhoneNumber())
                .orElseThrow(() -> new ResourceNotFoundException("Benutzer nicht gefunden."));

        // 2. Prüfen, ob bereits verifiziert
        if (user.isPhoneVerified()) {
            // Kein Fehler, aber auch keine Aktion nötig.
            return; 
        }

        // 3. Prüfen, ob ein OTP gespeichert ist
        if (user.getSmsOtp() == null || user.getSmsOtpExpiresAt() == null) {
            throw new IllegalStateException("Kein ausstehender OTP gefunden. Bitte erneut anfordern.");
        }

        // 4. Prüfen, ob der OTP abgelaufen ist
        if (OffsetDateTime.now().isAfter(user.getSmsOtpExpiresAt())) {
            // OTP löschen, um Wiederverwendung zu verhindern
            user.setSmsOtp(null);
            user.setSmsOtpExpiresAt(null);
            userRepository.save(user);
            throw new IllegalStateException("OTP ist abgelaufen. Bitte einen neuen Code anfordern.");
        }

        // 5. Prüfen, ob der OTP-Code korrekt ist
        if (!user.getSmsOtp().equals(request.getOtp())) {
            throw new IllegalArgumentException("Ungültiger OTP-Code.");
        }

        // 6. Erfolg! Benutzer als verifiziert markieren
        user.setPhoneVerified(true);
        
        // 7. OTP-Felder aus Sicherheitsgründen löschen
        user.setSmsOtp(null);
        user.setSmsOtpExpiresAt(null);

        userRepository.save(user);
    }

    // --- Private Hilfsmethoden ---

    private boolean isTunisianNumber(String phone) {
        // Implementieren Sie hier Ihre Validierungslogik
        // z.B. Regex für (2, 3, 4, 5, 7, 9) + 7 Ziffern
        return phone != null && phone.matches("^(2|3|4|5|7|9)\\d{7}$");
    }

    private String generateOtp() {
        // Erzeugt einen 6-stelligen Code
        return String.format("%06d", new Random().nextInt(999999));
    }
}