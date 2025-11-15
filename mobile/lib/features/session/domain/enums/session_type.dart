import 'package:freezed_annotation/freezed_annotation.dart';

// Matches SessionType.java
enum SessionType {
  @JsonValue('group')
  group,
  @JsonValue('one_on_one')
  oneOnOne,
}
