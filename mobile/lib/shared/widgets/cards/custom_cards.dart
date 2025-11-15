import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart'; // Assuming AppTheme is correctly imported

class PrimaryCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const PrimaryCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppTheme.cleanWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String location;
  final int participants;
  final int maxParticipants;
  final bool isLocked;
  final bool isVerified;
  final VoidCallback? onTap;

  const SessionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.location,
    required this.participants,
    required this.maxParticipants,
    this.isLocked = false,
    this.isVerified = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: isLocked ? null : onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTheme.sessionCardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isLocked)
                const Icon(
                  Icons.lock_outline,
                  color: AppTheme.disabledGray,
                  size: 20,
                ),
              if (isVerified)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: AppTheme.verifiedBadgeDecoration,
                  child: Text(
                    'Verified',
                    style: AppTheme.verifiedBadgeText,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTheme.sessionCardSubtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                // Replaced .withOpacity(0.6) with .withAlpha(153)
                color: AppTheme.darkGray.withAlpha(153),
              ),
              const SizedBox(width: 4),
              Text(
                time,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      // Replaced .withOpacity(0.8) with .withAlpha(204)
                      color: AppTheme.darkGray.withAlpha(204),
                    ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.location_on_outlined,
                size: 16,
                // Replaced .withOpacity(0.6) with .withAlpha(153)
                color: AppTheme.darkGray.withAlpha(153),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        // Replaced .withOpacity(0.8) with .withAlpha(204)
                        color: AppTheme.darkGray.withAlpha(204),
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.people_outline,
                size: 16,
                // Replaced .withOpacity(0.6) with .withAlpha(153)
                color: AppTheme.darkGray.withAlpha(153),
              ),
              const SizedBox(width: 4),
              Text(
                '$participants/$maxParticipants',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      // Replaced .withOpacity(0.8) with .withAlpha(204)
                      color: AppTheme.darkGray.withAlpha(204),
                    ),
              ),
              const Spacer(),
              if (isLocked)
                Text(
                  'Verification Required',
                  style: AppTheme.lockedFeatureText,
                ),
            ],
          ),
        ],
      ),
    );
  }
}