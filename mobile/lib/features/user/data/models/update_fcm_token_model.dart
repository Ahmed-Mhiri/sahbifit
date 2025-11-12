import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_fcm_token_model.freezed.dart';
part 'update_fcm_token_model.g.dart';

// Matches UpdateFcmTokenDto.java
@freezed
class UpdateFcmTokenModel with _$UpdateFcmTokenModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory UpdateFcmTokenModel({
    required String fcmToken,
  }) = _UpdateFcmTokenModel;

  factory UpdateFcmTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenModelFromJson(json);
}