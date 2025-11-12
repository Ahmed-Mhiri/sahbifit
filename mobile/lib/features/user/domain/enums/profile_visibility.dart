import 'package:freezed_annotation/freezed_annotation.dart';

// Matches ProfileVisibility.java
enum ProfileVisibility {
  @JsonValue('all')
  all,
  @JsonValue('same_gender')
  sameGender,
}