import 'package:flutter/material.dart';
import '../../../../../shared_widgets/theme_components.dart';
import '../../../../../core/utils/icon_utils.dart';

class SessionParticipantList extends StatelessWidget {
  final List<SessionParticipant> participants;
  final bool showAttendanceActions;
  final Function(String, bool)? onAttendanceChanged;

  const SessionParticipantList({
    super.key,
    required this.participants,
    this.showAttendanceActions = false,
    this.onAttendanceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Participants (${participants.length})',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        if (participants.isEmpty)
          const Text('No participants yet')
        else
          ...participants.map((participant) => _buildParticipantCard(context, participant)),
      ],
    );
  }

  Widget _buildParticipantCard(BuildContext context, SessionParticipant participant) {
    return SahbifitCard(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: participant.avatarUrl != null
                ? NetworkImage(participant.avatarUrl!)
                : null,
            child: participant.avatarUrl == null
                ? const Icon(Icons.person)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      participant.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (participant.isVerified) ...[
                      const SizedBox(width: 4),
                      Icon(IconUtils.verifiedBadge, size: 16, color: Colors.blue),
                    ],
                  ],
                ),
                Text(
                  participant.status.displayName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(participant.status),
                      ),
                ),
              ],
            ),
          ),
          if (showAttendanceActions && onAttendanceChanged != null)
            _buildAttendanceToggle(participant),
        ],
      ),
    );
  }

  Widget _buildAttendanceToggle(SessionParticipant participant) {
    final isPresent = participant.status == ParticipantStatus.attended;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isPresent ? 'Present' : 'Absent',
          style: TextStyle(
            color: isPresent ? Colors.green : Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Switch(
          value: isPresent,
          onChanged: (value) {
            onAttendanceChanged!(participant.id, value);
          },
          activeColor: Colors.green,
        ),
      ],
    );
  }

  Color _getStatusColor(ParticipantStatus status) {
    switch (status) {
      case ParticipantStatus.attended:
        return Colors.green;
      case ParticipantStatus.registered:
        return Colors.blue;
      case ParticipantStatus.noShow:
        return Colors.red;
      case ParticipantStatus.pending:
        return Colors.orange;
    }
  }
}
