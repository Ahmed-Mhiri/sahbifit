import 'package:flutter/material.dart' hide Badge;
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/user/domain/entities/badge.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart'; // For EmptyStateWidget

class UserBadgeList extends StatelessWidget {
  final List<Badge> badges;

  const UserBadgeList({
    super.key,
    required this.badges,
  });

  @override
  Widget build(BuildContext context) {
    if (badges.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.shield_outlined,
        title: 'No Badges Yet',
        message: 'Badges you earn from sessions will appear here.',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.defaultPadding,
          ),
          child: Text(
            'Badges',
            style: context.textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: AppTheme.elementSpacing),
        SizedBox(
          height: 100, // Fixed height for horizontal list
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.defaultPadding,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: badges.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppTheme.elementSpacing),
            itemBuilder: (context, index) {
              final badge = badges[index];
              return Tooltip(
                message: badge.description,
                child: SizedBox(
                  width: 80,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppTheme.lightGray,
                        // Use Image.network if iconUrl is present, else placeholder
                        child: badge.iconUrl != null
                            ? Image.network(
                                badge.iconUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.shield,
                                        color: AppTheme.disabledGray),
                              )
                            : const Icon(Icons.shield,
                                color: AppTheme.disabledGray),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        badge.badgeName,
                        style: context.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
