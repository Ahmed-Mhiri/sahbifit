import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🎨 Your Theme Plan - Color Palette
  static const Color primaryRed = Color(0xFFBA0000); // Logo Red - WCAG AA Compliant
  static const Color primaryDarkGray = Color(0xFF222222); // Logo Dark Gray - Primary Text
  static const Color backgroundWhite = Color(0xFFFFFFFF); // Clean White Background
  static const Color lightGrayUI = Color(0xFFF5F5F7); // Light Gray for UI elements
  static const Color trustBlue = Color(0xFF007AFF); // Trust/Safety Blue
  static const Color warningYellow = Color(0xFFFFC107); // Warning Yellow
  static const Color successGreen = Color(0xFF4CAF50); // Success Green
  static const Color disabledGray = Color(0xFF9E9E9E); // Disabled state
  
  // Session type colors (REMOVED to simplify theme)
  // static const Color groupSessionColor = Color(0xFF2196F3);
  // static const Color oneOnOneSessionColor = Color(0xFF9C27B0);
  
  // Gradient for special elements
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryRed, Color(0xFFE53935)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 🔠 Your Theme Plan - Typography (Poppins)
  static final TextTheme _textTheme = GoogleFonts.poppinsTextTheme(
    const TextTheme(
      // Headlines - matches logo strength
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700, // Bold
        fontSize: 28,
        height: 1.2,
        color: primaryDarkGray,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600, // Semi-Bold
        fontSize: 24,
        height: 1.3,
        color: primaryDarkGray,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600, // Semi-Bold
        fontSize: 20,
        height: 1.4,
        color: primaryDarkGray,
      ),
      
      // Body Text - clean and readable
      bodyLarge: TextStyle(
        fontWeight: FontWeight.normal, // Regular
        fontSize: 16,
        height: 1.5,
        color: primaryDarkGray,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal, // Regular
        fontSize: 14,
        height: 1.4,
        color: primaryDarkGray,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.normal, // Regular
        fontSize: 12,
        height: 1.3,
        color: primaryDarkGray,
      ),
      
      // Button Text - strong and clear
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600, // Semi-Bold
        fontSize: 16,
        height: 1.2,
        letterSpacing: 0.5,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500, // Medium
        fontSize: 14,
        height: 1.2,
        letterSpacing: 0.3,
      ),
      
      // Title Text
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600, // Semi-Bold
        fontSize: 18,
        height: 1.3,
        color: primaryDarkGray,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500, // Medium
        fontSize: 16,
        height: 1.4,
        color: primaryDarkGray,
      ),
    ),
  );

  // The main theme of your app
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // 1. Colors
      primaryColor: primaryRed,
      scaffoldBackgroundColor: backgroundWhite,
      colorScheme: const ColorScheme.light(
        primary: primaryRed, // Primary action color
        secondary: trustBlue, // Secondary actions/info
        background: backgroundWhite,
        surface: backgroundWhite, // Color for cards
        onPrimary: Colors.white, // Text on red buttons
        onSecondary: Colors.white,
        onBackground: primaryDarkGray, // Main text color
        onSurface: primaryDarkGray, // Text on cards
        error: Color(0xFFD32F2F), // For errors
        outline: lightGrayUI, // For borders
      ),

      // 2. Typography
      textTheme: _textTheme,
      fontFamily: 'Poppins',

      // 3. Component Styling
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundWhite,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        iconTheme: const IconThemeData(color: primaryDarkGray),
        titleTextStyle: _textTheme.headlineSmall?.copyWith(fontSize: 20),
        centerTitle: false,
      ),

      // Elevated Buttons - Primary CTAs
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: Colors.white,
          disabledBackgroundColor: disabledGray,
          disabledForegroundColor: Colors.white70,
          textStyle: _textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          minimumSize: const Size(64, 48),
        ),
      ),

      // Outlined Buttons - Secondary actions
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryDarkGray,
          textStyle: _textTheme.labelMedium,
          side: const BorderSide(color: lightGrayUI, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),

      // Text Buttons - Tertiary actions
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryRed,
          textStyle: _textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),

      // Input Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightGrayUI,
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
          borderSide: const BorderSide(color: Color(0xFFD32F2F), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: _textTheme.bodyMedium?.copyWith(
          color: disabledGray,
        ),
        labelStyle: _textTheme.bodyMedium?.copyWith(
          color: primaryDarkGray,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: backgroundWhite,
        elevation: 2,
        shadowColor: primaryDarkGray.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: backgroundWhite,
        selectedItemColor: primaryRed,
        unselectedItemColor: primaryDarkGray,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: lightGrayUI,
        thickness: 1,
        space: 1,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryRed,
        linearTrackColor: lightGrayUI,
      ),
    );
  }

  // Custom text styles for specific use cases
  static TextStyle get sessionCardTitle => _textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get sessionCardSubtitle => _textTheme.bodyMedium!.copyWith(
        color: disabledGray,
      );

  static TextStyle get badgeText => _textTheme.labelSmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      );

  static TextStyle get probationBannerText => _textTheme.bodyMedium!.copyWith(
        color: primaryDarkGray,
        fontWeight: FontWeight.w500,
      );

  // Custom box shadows
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: primaryDarkGray.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get buttonShadow => [
        BoxShadow(
          color: primaryRed.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
}

// Extension for easy theme access
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  // Quick access to custom colors
  Color get primaryRed => AppTheme.primaryRed;
  Color get primaryDarkGray => AppTheme.primaryDarkGray;
  Color get lightGrayUI => AppTheme.lightGrayUI;
  Color get trustBlue => AppTheme.trustBlue;
  Color get warningYellow => AppTheme.warningYellow;
}