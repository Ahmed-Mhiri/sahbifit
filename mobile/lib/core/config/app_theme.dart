
import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette - Following the "minimalist with a punch" theme
  static const Color primaryRed = Color(0xFFCC0000);    // Logo Red - Primary Action
  static const Color darkGray = Color(0xFF222222);      // Primary Text & Structure
  static const Color cleanWhite = Color(0xFFFFFFFF);    // Background
  static const Color lightGray = Color(0xFFF5F5F7);     // UI Elements
  static const Color trustBlue = Color(0xFF007AFF);     // Safety & Information
  static const Color warningYellow = Color(0xFFFFCC00); // Warning/Probationary
  static const Color successGreen = Color(0xFF34C759);  // Success states
  static const Color disabledGray = Color(0xFF8E8E93);  // Disabled elements

  // Typography - Using internal Poppins font
  static TextTheme get textTheme {
    const String fontFamily = 'Poppins';
    
    return TextTheme(
      // Headlines - Bold/Semi-Bold for strength
      displayLarge: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: darkGray,
      ),
      displayMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: darkGray,
      ),
      displaySmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: darkGray,
      ),
      headlineMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: darkGray,
      ),
      headlineSmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: darkGray,
      ),
      
      // Body Text - Regular for readability
      bodyLarge: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: darkGray,
      ),
      bodyMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: darkGray,
      ),
      bodySmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: darkGray,
      ),
      
      // Titles - Medium weight for emphasis
      titleLarge: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: darkGray,
      ),
      titleMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: darkGray,
      ),
      titleSmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: darkGray,
      ),
      
      // Labels - Medium/Semi-Bold for buttons and CTAs
      labelLarge: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: cleanWhite,
      ),
      labelMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: cleanWhite,
      ),
      labelSmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: cleanWhite,
      ),
    );
  }

  // Light Theme - Primary theme for the app
  static ThemeData get lightTheme {
    const String fontFamily = 'Poppins';
    
    return ThemeData(
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: primaryRed,
        onPrimary: cleanWhite,
        secondary: darkGray,
        onSecondary: cleanWhite,
        background: cleanWhite,
        onBackground: darkGray,
        surface: cleanWhite,
        onSurface: darkGray,
        error: primaryRed,
        onError: cleanWhite,
      ),
      
      // Typography
      textTheme: textTheme,
      useMaterial3: true,
      fontFamily: fontFamily,
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: cleanWhite,
        foregroundColor: darkGray,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: darkGray,
        ),
        iconTheme: IconThemeData(color: darkGray),
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: cleanWhite,
        selectedItemColor: primaryRed,
        unselectedItemColor: darkGray,
        selectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
      
      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryRed,
        foregroundColor: cleanWhite,
        elevation: 4,
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: cleanWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: cleanWhite,
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkGray,
          side: const BorderSide(color: darkGray, width: 1),
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryRed,
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryRed, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryRed, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: disabledGray,
        ),
        labelStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: darkGray,
        ),
        errorStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: primaryRed,
        ),
      ),
      
      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: cleanWhite,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: darkGray,
        ),
        contentTextStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: darkGray,
        ),
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: lightGray,
        selectedColor: primaryRed,
        secondarySelectedColor: primaryRed,
        disabledColor: disabledGray,
        labelStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: darkGray,
        ),
        secondaryLabelStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: cleanWhite,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: lightGray,
        thickness: 1,
        space: 1,
      ),
      
      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryRed,
        linearTrackColor: lightGray,
      ),
    );
  }

  // Custom text styles for specific use cases
  static TextStyle get sessionCardTitle => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: darkGray,
  );

  static TextStyle get sessionCardSubtitle => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: darkGray,
  );

  static TextStyle get probationBannerText => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: darkGray,
  );

  static TextStyle get verifiedBadgeText => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: trustBlue,
  );

  static TextStyle get lockedFeatureText => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: disabledGray,
  );

  // Custom box decorations
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: cleanWhite,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: darkGray.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration get probationBannerDecoration => BoxDecoration(
    color: warningYellow,
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration get verifiedBadgeDecoration => BoxDecoration(
    color: trustBlue.withOpacity(0.1),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: trustBlue, width: 1),
  );

  static BoxDecoration get lockedFeatureDecoration => BoxDecoration(
    color: lightGray,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: disabledGray, width: 1),
  );

  // Custom button styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryRed,
    foregroundColor: cleanWhite,
    textStyle: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 0,
  );

  static ButtonStyle get disabledButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: disabledGray,
    foregroundColor: cleanWhite,
    textStyle: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 0,
  );

  static ButtonStyle get secondaryButtonStyle => OutlinedButton.styleFrom(
    foregroundColor: darkGray,
    side: const BorderSide(color: darkGray, width: 1),
    textStyle: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  // Spacing constants
  static const double defaultPadding = 16.0;
  static const double cardPadding = 12.0;
  static const double sectionSpacing = 24.0;
  static const double elementSpacing = 8.0;
}

// Extension for easy theme access
extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  // Custom theme shortcuts
  Color get primaryRed => AppTheme.primaryRed;
  Color get darkGray => AppTheme.darkGray;
  Color get cleanWhite => AppTheme.cleanWhite;
  Color get lightGray => AppTheme.lightGray;
  Color get trustBlue => AppTheme.trustBlue;
  Color get warningYellow => AppTheme.warningYellow;
}