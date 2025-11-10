import 'package:json_annotation/json_annotation.dart';

enum VerificationStatus {
  @JsonValue('not_started')
  notStarted,

  @JsonValue('pending_review')
  pendingReview,

  @JsonValue('verified')
  verified,

  @JsonValue('rejected_bad_video')
  rejectedBadVideo,

  @JsonValue('rejected_mismatch')
  rejectedMismatch,
}