import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';

class SessionParticipantList extends StatelessWidget {
  final List<SessionParticipant> participants;
  final Function(String userId, ParticipantStatus status)? onMarkAttendance;

  const SessionParticipantList({
    super.key,
    required this.participants,
    this.onMarkAttendance,
  });

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'No one has joined yet. Be the first!',
            style: AppTheme.lockedFeatureText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: participants.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final participant = participants[index];

        return ListTile(
          contentPadding: EdgeInsets.zero, // Removes default padding to align with page
          onTap: () {
            // Navigate to user profile on tap
            context.push('/user/${participant.userId}');
          },
          leading: CircleAvatar(
            backgroundColor: AppTheme.lightGray,
            // Load image if available, otherwise null (falls back to child)
            backgroundImage: participant.user.profilePhotoUrl != null
                ? NetworkImage(participant.user.profilePhotoUrl!)
                : null,
            child: participant.user.profilePhotoUrl == null
                ? Text(
                    participant.user.firstName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(color: AppTheme.darkGray),
                  )
                : null,
          ),
          title: Text(
            participant.user.firstName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            'Status: ${participant.status.name}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _getStatusColor(participant.status),
                ),
          ),
          // If onMarkAttendance is provided (Admin/Owner), show buttons.
          // Otherwise, show a forward arrow to indicate navigation is possible.
          trailing: onMarkAttendance != null
              ? _buildAttendanceButtons(context, participant)
              : const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppTheme.disabledGray,
                ),
        );
      },
    );
  }

  Widget _buildAttendanceButtons(
      BuildContext context, SessionParticipant participant) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.check_circle_rounded,
            color: participant.status == ParticipantStatus.attended
                ? AppTheme.successGreen
                : AppTheme.disabledGray,
          ),
          onPressed: () =>
              onMarkAttendance!(participant.userId, ParticipantStatus.attended),
        ),
        IconButton(
          icon: Icon(
            Icons.cancel_rounded,
            color: participant.status == ParticipantStatus.noShow
                ? AppTheme.primaryRed
                : AppTheme.disabledGray,
          ),
          onPressed: () =>
              onMarkAttendance!(participant.userId, ParticipantStatus.noShow),
        ),
      ],
    );
  }

  Color _getStatusColor(ParticipantStatus status) {
    switch (status) {
      case ParticipantStatus.attended:
        return AppTheme.successGreen;
      case ParticipantStatus.noShow:
        return AppTheme.primaryRed;
      case ParticipantStatus.joined:
        return AppTheme.trustBlue;
      default:
        return AppTheme.disabledGray;
    }
  }
}