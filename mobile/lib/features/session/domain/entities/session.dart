import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/session/domain/enums/session_status.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';

class Session extends Equatable {
  final String sessionId;
  final String title;
  final SessionType sessionType;
  final SessionStatus status;
  final DateTime startTime;
  final DateTime endTime;
  final int maxParticipants;
  final int participantCount; // From the @Formula
  final User creator; // Nested User entity
  final Gym gym;     // Nested Gym entity

  const Session({
    required this.sessionId,
    required this.title,
    required this.sessionType,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.maxParticipants,
    required this.participantCount,
    required this.creator,
    required this.gym,
  });

  @override
  List<Object?> get props => [
        sessionId,
        title,
        sessionType,
        status,
        startTime,
        endTime,
        participantCount,
        creator,
        gym,
      ];
}
