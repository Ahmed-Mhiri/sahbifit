import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/user/data/models/badge_model.dart';

part 'user_badge_model.freezed.dart';
part 'user_badge_model.g.dart';

// This model maps to UserBadgeId.java
@freezed
class UserBadgeIdModel with _$UserBadgeIdModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UserBadgeIdModel({
    required String userId,
    required int badgeId,
  }) = _UserBadgeIdModel;

  factory UserBadgeIdModel.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeIdModelFromJson(json);
}

// This model maps to UserBadge.java
@freezed
class UserBadgeModel with _$UserBadgeModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UserBadgeModel({
    required UserBadgeIdModel id,
    required BadgeModel badge, // The badge that was earned
    required String earnedAt,  // Received as ISO 8601 String
  }) = _UserBadgeModel;

  factory UserBadgeModel.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeModelFromJson(json);
}