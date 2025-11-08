package com.sahbifit.api.security;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.crypto.SecretKey;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
// import io.jsonwebtoken.SignatureAlgorithm; // Removed: Deprecated
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException; // Added: New exception class

@Component
public class JwtTokenProvider {

    private static final Logger logger = LoggerFactory.getLogger(JwtTokenProvider.class);

    @Value("${app.jwtSecret}")
    private String jwtSecret;

    @Value("${app.jwtExpirationInMs}")
    private int jwtExpirationInMs;

    private SecretKey getSigningKey() {
        return Keys.hmacShaKeyFor(jwtSecret.getBytes());
    }

    // Creates a JWT for an authenticated user WITH ROLES
    public String generateToken(Authentication authentication) {
        UserDetails userPrincipal = (UserDetails) authentication.getPrincipal();

        // Extract roles from Authorities
        List<String> roles = userPrincipal.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());

        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + jwtExpirationInMs);

        return Jwts.builder()
                .subject(userPrincipal.getUsername()) // Replaced setSubject
                .claim("roles", roles) // 🆕 Store roles in token
                .issuedAt(new Date()) // Replaced setIssuedAt
                .expiration(expiryDate) // Replaced setExpiration
                .signWith(getSigningKey(), Jwts.SIG.HS512) // Replaced SignatureAlgorithm.HS512
                .compact();
    }

    // Extracts the phone number from the JWT
    public String getUsernameFromJWT(String token) {
        Claims claims = Jwts.parser() // Replaced parserBuilder()
                .verifyWith(getSigningKey()) // Replaced setSigningKey()
                .build()
                .parseSignedClaims(token) // Replaced parseClaimsJws()
                .getPayload(); // Replaced getBody()

        return claims.getSubject();
    }

    // 🆕 Extracts roles from JWT token
    public List<String> getRolesFromJWT(String token) {
        Claims claims = Jwts.parser() // Replaced parserBuilder()
                .verifyWith(getSigningKey()) // Replaced setSigningKey()
                .build()
                .parseSignedClaims(token) // Replaced parseClaimsJws()
                .getPayload(); // Replaced getBody()

        return claims.get("roles", List.class);
    }

    // Validates a JWT
    public boolean validateToken(String authToken) {
        try {
            Jwts.parser() // Replaced parserBuilder()
                .verifyWith(getSigningKey()) // Replaced setSigningKey()
                .build()
                .parseSignedClaims(authToken); // Replaced parseClaimsJws()
            return true;
        } catch (SignatureException ex) { // Using new security.SignatureException
            logger.error("Invalid JWT signature");
        } catch (MalformedJwtException ex) {
            logger.error("Invalid JWT token");
        } catch (ExpiredJwtException ex) {
            logger.error("Expired JWT token");
        } catch (UnsupportedJwtException ex) {
            logger.error("Unsupported JWT token");
        } catch (IllegalArgumentException ex) {
            logger.error("JWT claims string is empty.");
        }
        return false;
    }
}