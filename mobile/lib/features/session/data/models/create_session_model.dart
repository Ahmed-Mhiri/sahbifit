import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';

part 'create_session_model.freezed.dart';
part 'create_session_model.g.dart';


@freezed
abstract class CreateSessionModel with _$CreateSessionModel {
  
  const factory CreateSessionModel({
    required String gymId,
    required SessionType sessionType,
    required String title,
    required String startTime, // Send as ISO 8601 String
    required String endTime,   // Send as ISO 8601 String
    required int maxParticipants,
  }) = _CreateSessionModel;

  factory CreateSessionModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionModelFromJson(json);
}
