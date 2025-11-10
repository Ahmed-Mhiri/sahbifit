import 'package:json_annotation/json_annotation.dart';

/// Enum for participant status.
/// CRITICAL: The @JsonValue MUST match the string in [ParticipantStatus.java]
enum ParticipantStatus {
  @JsonValue('joined')
  joined,

  @JsonValue('attended')
  attended,

  @JsonValue('no_show')
  noShow, // Dart enum name can be camelCase

  @JsonValue('left')
  left,
}