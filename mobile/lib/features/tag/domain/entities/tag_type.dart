import 'package:freezed_annotation/freezed_annotation.dart';

// This matches your TagType.java enum
// The @JsonValue is for when we send this in a query parameter
enum TagType {
  @JsonValue('goal')
  goal,
  
  @JsonValue('schedule')
  schedule,
}