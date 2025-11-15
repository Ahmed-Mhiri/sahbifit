import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

class VisibilitySettingsWidget extends StatelessWidget {
  final ProfileVisibility currentVisibility;
  final VerifiedGender verifiedGender;
  final ValueChanged<ProfileVisibility> onChanged;

  const VisibilitySettingsWidget({
    super.key,
    required this.currentVisibility,
    required this.verifiedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool canSelectSameGender =
        verifiedGender != VerifiedGender.notVerified;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.defaultPadding,
        vertical: AppTheme.elementSpacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Visibility',
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: AppTheme.elementSpacing),
          Text(
            'Control who can see your profile and sessions.',
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: AppTheme.elementSpacing),
          // Option 1: All Users
          RadioListTile<ProfileVisibility>(
            title: const Text('Show to all users'),
            value: ProfileVisibility.all,
            // ignore: deprecated_member_use
            groupValue: currentVisibility,
            // ignore: deprecated_member_use
            onChanged: (value) => onChanged(ProfileVisibility.all),
            activeColor: AppTheme.primaryRed,
          ),
          // Option 2: Same Gender Only
          RadioListTile<ProfileVisibility>(
            title: const Text('Show to same gender only'),
            subtitle: !canSelectSameGender
                ? Text(
                    'You must be verified to use this option.',
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppTheme.disabledGray),
                  )
                : null,
            value: ProfileVisibility.sameGender,
            // ignore: deprecated_member_use
            groupValue: currentVisibility,
            // Disable if gender is not verified
            // ignore: deprecated_member_use
            onChanged: canSelectSameGender
                ? (value) => onChanged(ProfileVisibility.sameGender)
                : null,
            activeColor: AppTheme.primaryRed,
          ),
        ],
      ),
    );
  }
}