import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahbifit_mobile/core/utils/icon_utils.dart' show IconUtils;
import 'package:sahbifit_mobile/shared_widgets/primary_button.dart' show PrimaryButton;
import '../../../../shared_widgets/smart_icon.dart';
import '../../../../shared_widgets/theme_components.dart';
class SessionCard extends StatelessWidget {
  final String title;
  final String gymName;
  final DateTime dateTime;
  final bool isGroupSession;
  final bool isLocked;
  final int participants;
  final int maxParticipants;
  final VoidCallback? onJoin;
  final VoidCallback? onTap;

  const SessionCard({
    super.key,
    required this.title,
    required this.gymName,
    required this.dateTime,
    required this.isGroupSession,
    this.isLocked = false,
    this.participants = 0,
    this.maxParticipants = 1,
    this.onJoin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SahbifitCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with session type and lock status
          Row(
            children: [
              SessionTypeIndicator(
                isGroupSession: isGroupSession,
              ),
              const Spacer(),
              if (isLocked) 
                Icon(
                  IconUtils.lockIcon,
                  color: Colors.grey,
                  size: 16,
                ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Session title
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 8),
          
          // Session details
          Row(
            children: [
              SmartIcon(icon: IconUtils.gymIcon, size: 16),
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
          
          const SizedBox(height: 4),
          
          Row(
            children: [
              SmartIcon(icon: IconUtils.timeIcon, size: 16),
              const SizedBox(width: 4),
              Text(
                '${DateFormat.jm().format(dateTime)} • ${DateFormat.MMMd().format(dateTime)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          
          if (isGroupSession) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                SmartIcon(icon: IconUtils.groupSessionIcon, size: 16),
                const SizedBox(width: 4),
                Text(
                  '$participants/$maxParticipants participants',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
          
          const SizedBox(height: 16),
          
          // Join button or locked state
          if (isLocked)
            LockedFeature(
              message: isGroupSession 
                  ? "Join Ambassador sessions while verification processes"
                  : "Attend 3 group sessions to unlock 1-on-1 sessions",
              onTap: () {
                // Show tooltip with more info
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isGroupSession
                        ? "Your profile verification is in progress. You can join sessions marked as 'Ambassador'."
                        : "Complete 3 successful group sessions to unlock 1-on-1 sessions."),
                  ),
                );
              },
            )
          else
            PrimaryButton(
              text: 'Join Session',
              onPressed: onJoin,
              icon: IconUtils.joinIcon,
            ),
        ],
      ),
    );
  }
}