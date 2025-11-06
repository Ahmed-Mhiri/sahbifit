package com.sahbifit.api.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    // (Optional) Fügen Sie hier Ihre CorsConfig-Bean ein, wenn Sie sie verwenden möchten
    // @Autowired
    // private CorsConfig corsConfig;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .cors() // Aktiviert CORS (vorausgesetzt, Sie haben eine @Bean CorsConfigurationSource)
            .and()
            .csrf().disable() // Deaktiviert CSRF für stateless API
            .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS) // Keine Sessions
            .and()
            .authorizeHttpRequests(authorize -> authorize
                // Hier geben wir die Auth-Endpunkte frei
                .requestMatchers("/api/auth/**").permitAll()
                // Alle anderen Anfragen erfordern Authentifizierung
                .anyRequest().authenticated()
            );

        // Fügt unseren JWT-Filter *vor* dem Standard-Spring-Security-Filter ein
        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}