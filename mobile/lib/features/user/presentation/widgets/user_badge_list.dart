import 'package:flutter/material.dart';
import 'package:sahbifit/features/user/domain/entities/badge.dart';
import 'package:sahbifit/shared_widgets/theme_components.dart';

class UserBadgeList extends StatelessWidget {
  final List<Badge> badges;

  const UserBadgeList({super.key, required this.badges});

  @override
  Widget build(BuildContext context) {
    if (badges.isEmpty) {
      return const SahbifitCard(
        child: Column(
          children: [
            Icon(Icons.emoji_events, size: 48, color: Colors.grey),
            SizedBox(height: 8),
            Text('No badges yet', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(
              'Complete sessions and build your reputation to earn badges',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return SahbifitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Badges',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: badges.map((badge) => _buildBadge(badge)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(Badge badge) {
    return Tooltip(
      message: badge.description,
      child: SizedBox(
        width: 70, // Provide a fixed width for alignment
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              // Load the image from the URL provided by the backend
              backgroundImage:
                  badge.iconUrl != null ? NetworkImage(badge.iconUrl!) : null,
              // Show a fallback icon if no URL is provided
              child: badge.iconUrl == null
                  ? Icon(Icons.emoji_events, color: Colors.grey[600])
                  : null,
            ),
            const SizedBox(height: 4),
            Text(
              badge.name, // Display the 'badgeName' (e.g., "UNRELIABLE")
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// NOTE: The mock classes and BadgeType enum previously at the bottom
// of this file (in your first prompt) are no longer needed
// as we now have the real domain entity 'Badge'.