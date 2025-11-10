import 'package:flutter/material.dart';
import 'package:sahbifit/features/user/presentation/pages/settings_page.dart';
import 'package:sahbifit/shared_widgets/theme_components.dart';
import 'package:sahbifit/core/utils/icon_utils.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final int age;
  final String? avatarUrl;
  final String gymName;
  final double rating;
  final int sessionsCompleted;
  final bool isVerified;
  final bool isCurrentUser;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.age,
    this.avatarUrl,
    required this.gymName,
    required this.rating,
    required this.sessionsCompleted,
    this.isVerified = false,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return SahbifitCard(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                child: avatarUrl == null
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '$userName, $age',
                            style: Theme.of(context).textTheme.headlineSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: 8),
                          Icon(IconUtils.verifiedBadge,
                              size: 20, color: Colors.blue),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(IconUtils.gymIcon, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            gymName,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(IconUtils.starIcon, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(rating.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(width: 16),
                        Icon(Icons.fitness_center, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text('$sessionsCompleted sessions',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isCurrentUser) ...[
            const SizedBox(height: 16),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                    onPressed: () {
                      // Navigate to edit profile
                      // Example: Navigator.pushNamed(context, '/edit-profile');
                    },
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    icon: const Icon(Icons.settings),
                    label: const Text('Settings'),
                    onPressed: () {
                      // Navigate to settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              // SettingsPage expects the ProfileBloc to be provided
                              BlocProvider.value(
                            value: BlocProvider.of<ProfileBloc>(context),
                            child: const SettingsPage(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}