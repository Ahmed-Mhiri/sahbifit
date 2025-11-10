import 'package:json_annotation/json_annotation.dart';

/// Enum for session type.
/// CRITICAL: The @JsonValue MUST match the string in [SessionType.java]
enum SessionType {
  @JsonValue('group')
  group,

  @JsonValue('one_on_one')
  oneOnOne, // Dart enum name can be camelCase
}