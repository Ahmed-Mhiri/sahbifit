import 'package:flutter/material.dart';
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
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            'No one has joined yet. Be the first!',
            style: AppTheme.lockedFeatureText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final participant = participants[index];
        return ListTile(
          leading: CircleAvatar(
            // Placeholder for profile pic
            backgroundColor: AppTheme.lightGray,
            child: Text(participant.user.firstName.substring(0, 1)),
          ),
          title: Text(
            participant.user.firstName,
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            'Status: ${participant.status.name}',
            style: context.textTheme.bodySmall?.copyWith(
              color: _getStatusColor(participant.status),
            ),
          ),
          trailing:
              onMarkAttendance != null ? _buildAttendanceButtons(context, participant) : null,
        );
      },
    );
  }

  Widget _buildAttendanceButtons(BuildContext context, SessionParticipant participant) {
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
