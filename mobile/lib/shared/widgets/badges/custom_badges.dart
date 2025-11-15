import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart'; // Assuming AppTheme is correctly imported

class StatusBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const StatusBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  factory StatusBadge.verified() {
    return StatusBadge(
      text: 'Verified',
      // Replaced .withAlpha(26) with .withAlpha(26)
      backgroundColor: AppTheme.trustBlue.withAlpha(26),
      textColor: AppTheme.trustBlue,
    );
  }

  factory StatusBadge.probationary() {
    return StatusBadge(
      text: 'Under Review',
      // Replaced .withAlpha(26) with .withAlpha(26)
      backgroundColor: AppTheme.warningYellow.withAlpha(26),
      textColor: AppTheme.darkGray,
    );
  }

  factory StatusBadge.reliable() {
    return StatusBadge(
      text: 'Reliable',
      // Replaced .withAlpha(26) with .withAlpha(26)
      backgroundColor: AppTheme.successGreen.withAlpha(26),
      textColor: AppTheme.successGreen,
    );
  }

  factory StatusBadge.unreliable() {
    return StatusBadge(
      text: 'Unreliable',
      // Replaced .withAlpha(26) with .withAlpha(26)
      backgroundColor: AppTheme.primaryRed.withAlpha(26),
      textColor: AppTheme.primaryRed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        // Replaced .withAlpha(77) with .withAlpha(77)
        border: Border.all(color: textColor.withAlpha(77)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const TagChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryRed : AppTheme.lightGray,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: selected ? AppTheme.cleanWhite : AppTheme.darkGray,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}