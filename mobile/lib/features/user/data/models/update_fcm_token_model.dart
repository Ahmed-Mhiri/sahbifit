import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_fcm_token_model.freezed.dart';
part 'update_fcm_token_model.g.dart';

// Matches UpdateFcmTokenDto.java

@freezed
abstract class UpdateFcmTokenModel with _$UpdateFcmTokenModel {
  
  const factory UpdateFcmTokenModel({
    required String fcmToken,
  }) = _UpdateFcmTokenModel;

  factory UpdateFcmTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenModelFromJson(json);
}
