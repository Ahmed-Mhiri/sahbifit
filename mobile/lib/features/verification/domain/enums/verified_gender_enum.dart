import 'package:freezed_annotation/freezed_annotation.dart';

// Matches VerifiedGender.java
enum VerifiedGender {
  @JsonValue('not_verified')
  notVerified,
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('other')
  other,
}