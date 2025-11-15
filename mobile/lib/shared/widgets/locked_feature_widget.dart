import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
class LockedFeatureWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onUnlock;

  const LockedFeatureWidget({
    super.key,
    required this.title,
    required this.message,
    this.onUnlock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.lockedFeatureDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.lock_outline,
            size: 32,
            color: AppTheme.disabledGray,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTheme.lockedFeatureText.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: AppTheme.lockedFeatureText.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          if (onUnlock != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onUnlock,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.disabledGray,
                  side: const BorderSide(color: AppTheme.disabledGray),
                ),
                child: Text(
                  'Learn How to Unlock',
                  style: AppTheme.lockedFeatureText,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}