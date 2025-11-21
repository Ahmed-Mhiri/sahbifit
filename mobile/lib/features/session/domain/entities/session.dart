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
  final int participantCount;
  final User creator; 
  final Gym gym;
  
  // âœ… NEW FIELD
  final bool isChatActive; 

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
    // âœ… Initialize with default false
    this.isChatActive = false, 
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
        isChatActive, // âœ… Add to props for equality checks
      ];
}