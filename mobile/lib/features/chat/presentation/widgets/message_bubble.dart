import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isMe ? AppTheme.primaryRed : AppTheme.lightGray;
    final textColor = isMe ? AppTheme.cleanWhite : AppTheme.darkGray;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
                bottomRight: isMe ? Radius.zero : const Radius.circular(16),
              ),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Text(
              message.text,
              style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            formatReadableTime(message.timestamp.toIso8601String()),
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppTheme.disabledGray,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
