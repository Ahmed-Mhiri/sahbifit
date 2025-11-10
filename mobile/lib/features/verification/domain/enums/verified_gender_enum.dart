import 'package:json_annotation/json_annotation.dart';

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