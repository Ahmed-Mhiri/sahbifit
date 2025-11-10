import 'package:flutter/material.dart';
import '../core/config/app_theme.dart';
import '../core/utils/theme_utils.dart';

// Reusable themed card with consistent styling
class SahbifitCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool showShadow;
  
  const SahbifitCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.backgroundColor,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: showShadow ? 2 : 0,
      shadowColor: showShadow ? AppTheme.primaryDarkGray.withOpacity(0.1) : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: ThemeUtils.cardBorderRadius,
      ),
      color: backgroundColor ?? AppTheme.backgroundWhite,
      child: InkWell(
        onTap: onTap,
        borderRadius: ThemeUtils.cardBorderRadius,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

// Secondary outlined button
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final IconData? icon;
  
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isEnabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: ThemeUtils.buttonBorderRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isEnabled ? AppTheme.primaryDarkGray : AppTheme.disabledGray,
            ),
          ),
        ],
      ),
    );
  }
}

// Locked feature indicator for gated functionality
class LockedFeature extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onTap;
  
  const LockedFeature({
    super.key,
    required this.message,
    this.icon = Icons.lock_outline,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.lightGrayUI,
        borderRadius: ThemeUtils.smallBorderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppTheme.disabledGray, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.disabledGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Session type indicator with icon
class SessionTypeIndicator extends StatelessWidget {
  final bool isGroupSession;
  final double iconSize;
  
  const SessionTypeIndicator({
    super.key,
    required this.isGroupSession,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ThemeUtils.getSessionTypeColor(isGroupSession).withOpacity(0.1),
        borderRadius: ThemeUtils.smallBorderRadius,
        border: Border.all(
          color: ThemeUtils.getSessionTypeColor(isGroupSession).withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            ThemeUtils.getSessionTypeIcon(isGroupSession),
            size: iconSize,
            color: ThemeUtils.getSessionTypeColor(isGroupSession),
          ),
          const SizedBox(width: 4),
          Text(
            ThemeUtils.getSessionTypeLabel(isGroupSession),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ThemeUtils.getSessionTypeColor(isGroupSession),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// Verified badge for trusted users
class VerifiedBadge extends StatelessWidget {
  final double size;
  
  const VerifiedBadge({
    super.key,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppTheme.trustBlue,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: size - 4,
      ),
    );
  }
}