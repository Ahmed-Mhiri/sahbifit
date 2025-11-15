import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class ChatLogisticsHeader extends StatelessWidget {
  const ChatLogisticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: AppTheme.lightGray,
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: AppTheme.disabledGray,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Chat is active 1 hour before and 24 hours after the session.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.disabledGray,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
