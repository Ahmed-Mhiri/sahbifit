import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';

/// A small widget showing social proof for a gym, like member count.
class GymSocialProofWidget extends StatelessWidget {
  final int memberCount;

  const GymSocialProofWidget({
    super.key,
    required this.memberCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.people_outline_rounded,
            color: AppTheme.darkGray,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            '$memberCount members train here',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
