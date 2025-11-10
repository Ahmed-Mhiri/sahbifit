import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import '../config/app_theme.dart';

class ThemeUtils {
  // Border radius
  static BorderRadius get cardBorderRadius => BorderRadius.circular(16);
  static BorderRadius get buttonBorderRadius => BorderRadius.circular(12);
  static BorderRadius get inputBorderRadius => BorderRadius.circular(12);
  static BorderRadius get smallBorderRadius => BorderRadius.circular(8);
  
  // Animation
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  
  // Spacing
  static const double defaultPadding = 16.0;
  static const double mediumPadding = 12.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  
  // Sizes
  static const double bottomNavBarHeight = 80.0;
  static const double appBarHeight = 56.0;
  static const double sessionCardHeight = 140.0;
  
  // Session Type Logic - SSOT (Single Source of Truth)
  static Color getSessionTypeColor(bool isGroupSession, {bool isLocked = false}) {
    if (isLocked) return AppTheme.disabledGray;
    // Use primary text color to simplify the palette.
    // The icon itself is enough differentiation.
    return AppTheme.primaryDarkGray;
  }
  
  static IconData getSessionTypeIcon(bool isGroupSession) {
    return isGroupSession ? FontAwesomeIcons.users : FontAwesomeIcons.user;
  }
  
  static String getSessionTypeLabel(bool isGroupSession) {
    return isGroupSession ? 'Group Session' : '1-on-1 Session';
  }
}