import 'package:freezed_annotation/freezed_annotation.dart';

// Matches SessionStatus.java
enum SessionStatus {
  @JsonValue('active')
  active,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('completed')
  completed,
}