import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class ChatDisabledPlaceholder extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const ChatDisabledPlaceholder({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.chat_bubble_outline_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: AppTheme.disabledGray.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.disabledGray),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
