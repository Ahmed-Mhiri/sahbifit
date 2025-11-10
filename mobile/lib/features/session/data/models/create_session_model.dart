
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart' ;
import 'package:json_annotation/json_annotation.dart';
import 'package:sahbifit_mobile/features/session/domain/enums/session_type.dart';

/// Data Transfer Object (DTO) for creating a session.
/// This maps directly to the backend's [CreateSessionDto.java].
@freezed
class CreateSessionModel with _$CreateSessionModel {
  @JsonSerializable(
    createFactory: false, // We only need toJson for sending data
    fieldRename: FieldRename.none, // Java fields are already camelCase
  )
  const factory CreateSessionModel({
    required String gymId,
    required SessionType sessionType,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    required int maxParticipants,
  }) = _CreateSessionModel;
}