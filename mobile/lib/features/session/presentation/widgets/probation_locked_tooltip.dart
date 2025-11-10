import 'package:flutter/material.dart';
import '../../../../shared_widgets/theme_components.dart';
import '../../../../core/utils/icon_utils.dart';

class ProbationLockedTooltip extends StatelessWidget {
  final bool isGroupSession;
  final VoidCallback? onViewAmbassadorSessions;

  const ProbationLockedTooltip({
    super.key,
    required this.isGroupSession,
    this.onViewAmbassadorSessions,
  });

  @override
  Widget build(BuildContext context) {
    final message = isGroupSession
        ? "Your profile verification is in progress. You can join sessions marked as 'Ambassador' while you wait."
        : "Complete 3 successful group sessions to unlock 1-on-1 sessions.";

    final actionText = isGroupSession ? "View Ambassador Sessions" : null;

    return LockedFeature(
      message: message,
      icon: IconUtils.lockIcon,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Row(
              children: [
                Icon(IconUtils.lockIcon, color: Colors.orange),
                const SizedBox(width: 8),
                Text('Feature Locked'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message),
                if (isGroupSession) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Your verification is being processed and will be approved within 12 hours.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Got It'),
              ),
              if (actionText != null && onViewAmbassadorSessions != null)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onViewAmbassadorSessions!();
                  },
                  child: Text(actionText),
                ),
            ],
          ),
        );
      },
    );
  }
}