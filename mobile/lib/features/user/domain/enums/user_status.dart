import 'package:freezed_annotation/freezed_annotation.dart';

// Matches UserStatus.java
enum UserStatus {
  @JsonValue('active')
  active,
  @JsonValue('suspended')
  suspended,
  @JsonValue('banned')
  banned,
}