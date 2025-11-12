import 'package:freezed_annotation/freezed_annotation.dart';

// Matches UserRole.java
enum UserRole {
  @JsonValue('member')
  member,
  @JsonValue('ambassador')
  ambassador,
  @JsonValue('admin')
  admin,
}