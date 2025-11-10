import 'package:flutter/material.dart';
import '../../../../core/config/app_theme.dart';

class ChatLogisticsHeader extends StatelessWidget {
  final String sessionTitle;
  final DateTime sessionTime;
  final bool isChatActive;

  const ChatLogisticsHeader({
    super.key,
    required this.sessionTitle,
    required this.sessionTime,
    required this.isChatActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.lightGrayUI,
        border: Border(
          bottom: BorderSide(color: AppTheme.lightGrayUI),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sessionTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Session: ${_formatSessionTime(sessionTime)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isChatActive ? Colors.green[50] : Colors.orange[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: isChatActive ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isChatActive
                        ? 'This chat is active for day-of logistics only. Be respectful and keep messages relevant to the session.'
                        : 'Chat will be enabled 1 hour before the session starts.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isChatActive ? Colors.green[800] : Colors.orange[800],
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatSessionTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')} - ${time.add(Duration(hours: 1)).hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}