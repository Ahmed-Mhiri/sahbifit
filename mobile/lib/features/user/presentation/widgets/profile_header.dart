// FILE: lib/features/user/presentation/widgets/profile_header.dart
import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/domain/enums/user_status.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/shared/widgets/badges/custom_badges.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Photo
        CircleAvatar(
          radius: 50,
          backgroundColor: AppTheme.lightGray,
          backgroundImage: user.profilePhotoUrl != null
              ? NetworkImage(user.profilePhotoUrl!)
              : null,
          child: user.profilePhotoUrl == null
              ? const Icon(Icons.person, size: 50, color: AppTheme.disabledGray)
              : null,
        ),
        const SizedBox(height: AppTheme.elementSpacing),

        // User Name
        Text(
          user.firstName,
          style: context.textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.elementSpacing),

        // Status Badges
        _buildStatusBadges(context, user),
        const SizedBox(height: AppTheme.sectionSpacing),

        // Primary Gym
        if (user.primaryGym != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 16, color: AppTheme.disabledGray),
              const SizedBox(width: 4),
              Text(
                user.primaryGym!.name,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppTheme.darkGray),
              ),
            ],
          ),
        const SizedBox(height: AppTheme.sectionSpacing),

        // User Stats
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatColumn(
              context,
              Icons.groups_rounded,
              'Sessions',
              user.groupSessionCount.toString(),
            ),
            _buildStatColumn(
              context,
              Icons.event_busy_rounded,
              'No-Shows',
              user.noShowCount.toString(),
            ),
            // --- UPDATED: Added Late Cancel Count ---
            _buildStatColumn(
              context,
              Icons.timer_off_outlined,
              'Late Cancels',
              user.lateCancelCount.toString(),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.sectionSpacing),
        const Divider(),
      ],
    );
  }

  Widget _buildStatusBadges(BuildContext context, User user) {
    final bool isReliable = user.groupSessionCount >= 5 && user.noShowCount == 0;

    return Wrap(
      spacing: AppTheme.elementSpacing,
      runSpacing: AppTheme.elementSpacing,
      alignment: WrapAlignment.center,
      children: [
        if (user.verificationStatus == VerificationStatus.verified)
          StatusBadge.verified(),

        if (user.verificationStatus == VerificationStatus.pendingReview)
          StatusBadge.probationary(),

        if (user.status == UserStatus.suspended)
          StatusBadge.unreliable()
        else if (isReliable)
          StatusBadge.reliable(),
      ],
    );
  }

  Widget _buildStatColumn(
      BuildContext context, IconData icon, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineMedium,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(icon, size: 14, color: AppTheme.disabledGray),
            const SizedBox(width: 4),
            Text(
              label,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: AppTheme.disabledGray),
            ),
          ],
        ),
      ],
    );
  }
}