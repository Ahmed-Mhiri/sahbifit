import 'package:json_annotation/json_annotation.dart';

/// Enum for session status.
/// CRITICAL: The @JsonValue MUST match the string in [SessionStatus.java]
enum SessionStatus {
  @JsonValue('active')
  active,

  @JsonValue('cancelled')
  cancelled,

  @JsonValue('completed')
  completed,
}