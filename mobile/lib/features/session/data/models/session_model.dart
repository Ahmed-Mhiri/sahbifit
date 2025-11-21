import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/gym/data/models/gym_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
// If SessionStatus is not returned by backend, we default it.
import 'package:sahbifit/features/session/domain/enums/session_status.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
// âœ… Import the new summary model
import 'package:sahbifit/features/user/data/models/user_summary_model.dart'; 

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
abstract class SessionModel with _$SessionModel {
  const SessionModel._();

  const factory SessionModel({
    required String sessionId,
    required String title,
    required String startTime,
    required String endTime,
    required SessionType sessionType,
    required int participantCount,
    required int maxParticipants,
    // âœ… Changed from UserModel to UserSummaryModel
    required UserSummaryModel creator, 
    required GymModel gym,
    // âœ… Fixed type from 'boolean' to 'bool' and added default
    @Default(false) bool isChatActive, 
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Session toEntity() {
    return Session(
      sessionId: sessionId,
      title: title,
      sessionType: sessionType,
      // âœ… Default to active since feed only returns active sessions [cite: 661]
      status: SessionStatus.active, 
      startTime: DateTime.parse(startTime),
      endTime: DateTime.parse(endTime),
      maxParticipants: maxParticipants,
      participantCount: participantCount,
      creator: creator.toEntity(), // Uses the safe defaults
      gym: gym.toEntity(),
      isChatActive: isChatActive, // âœ… Maps to domain
    );
  }
}