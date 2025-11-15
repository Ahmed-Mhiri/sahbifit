import 'package:freezed_annotation/freezed_annotation.dart';

// Matches ParticipantStatus.java
enum ParticipantStatus {
  @JsonValue('joined')
  joined,
  @JsonValue('attended')
  attended,
  @JsonValue('no_show')
  noShow,
  @JsonValue('left')
  left,
}
