// lib/shared_widgets/smart_icon.dart

import 'package:flutter/material.dart';
import '../core/utils/icon_utils.dart';
import '../core/utils/theme_utils.dart';

class SmartIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final bool isLocked;
  
  const SmartIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: isLocked ? Colors.grey : color,
    );
  }
}

// Specialized icon widgets for common use cases
class SessionTypeIcon extends StatelessWidget {
  final bool isGroupSession;
  final double size;
  final bool isLocked;
  
  const SessionTypeIcon({
    super.key,
    required this.isGroupSession,
    this.size = 24,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return SmartIcon(
      icon: IconUtils.getSessionTypeIcon(isGroupSession),
      size: size,
      color: ThemeUtils.getSessionTypeColor(isGroupSession, isLocked: isLocked), // <-- Change this class
      isLocked: isLocked,
    );
  }
}

class VerifiedBadgeIcon extends StatelessWidget {
  final double size;
  
  const VerifiedBadgeIcon({
    super.key,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Icon(
        IconUtils.verifiedBadge,
        color: Colors.white,
        size: size - 4,
      ),
    );
  }
}

class LockStatusIcon extends StatelessWidget {
  final bool isLocked;
  final double size;
  
  const LockStatusIcon({
    super.key,
    required this.isLocked,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SmartIcon(
      icon: isLocked ? IconUtils.lockIcon : IconUtils.unlockIcon,
      size: size,
      color: isLocked ? Colors.grey : Colors.green,
    );
  }
}