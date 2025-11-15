import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
class ProbationaryBanner extends StatelessWidget {
  final VoidCallback onLearnMore;

  const ProbationaryBanner({super.key, required this.onLearnMore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.probationBannerDecoration,
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: AppTheme.darkGray,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verification in Progress',
                  style: AppTheme.probationBannerText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your profile is under review. You can join Ambassador sessions while we verify your account.',
                  style: AppTheme.probationBannerText.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: onLearnMore,
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.darkGray,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            child: Text(
              'Learn More',
              style: AppTheme.probationBannerText.copyWith(
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}