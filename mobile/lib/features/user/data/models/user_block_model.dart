import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/user/data/models/user_model.dart';

part 'user_block_model.freezed.dart';
part 'user_block_model.g.dart';

// This model maps to UserBlockId.java
@freezed
class UserBlockIdModel with _$UserBlockIdModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UserBlockIdModel({
    required String blockerUserId,
    required String blockedUserId,
  }) = _UserBlockIdModel;

  factory UserBlockIdModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockIdModelFromJson(json);
}

// This model maps to UserBlock.java
@freezed
class UserBlockModel with _$UserBlockModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UserBlockModel({
    required UserBlockIdModel id,
    required UserModel blocker, // The user who did the blocking
    required UserModel blocked, // The user who was blocked
    required String createdAt, // Received as ISO 8601 String
  }) = _UserBlockModel;

  factory UserBlockModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockModelFromJson(json);
}