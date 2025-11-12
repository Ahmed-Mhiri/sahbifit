import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';

class SessionParticipant extends Equatable {
  final String sessionId;
  final String userId;
  final User user; // The full user object
  final ParticipantStatus status;
  final DateTime joinedAt;

  const SessionParticipant({
    required this.sessionId,
    required this.userId,
    required this.user,
    required this.status,
    required this.joinedAt,
  });

  @override
  List<Object?> get props => [sessionId, userId, user, status, joinedAt];
}