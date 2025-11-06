package com.sahbifit.api.security;

import com.sahbifit.api.user.model.User;
import com.sahbifit.api.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList; // Wichtig

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String phoneNumber) throws UsernameNotFoundException {
        // Wir laden den Benutzer anhand der Telefonnummer (unser "Username")
        User user = userRepository.findByPhoneNumber(phoneNumber)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with phone number: " + phoneNumber));

        // Hier können wir später die Verifizierungs-Logik einbauen
        if (!user.isPhoneVerified()) {
            // Sie können hier eine spezifischere Ausnahme auslösen,
            // aber für Spring Security ist "Disabled" passend.
            throw new UsernameNotFoundException("User phone not verified."); 
        }

        // Erstellt ein Spring Security User-Objekt
        return new org.springframework.security.core.userdetails.User(
                user.getPhoneNumber(),
                user.getPassword(),
                new ArrayList<>() // Leere Liste für Berechtigungen (Rollen)
        );
    }
}