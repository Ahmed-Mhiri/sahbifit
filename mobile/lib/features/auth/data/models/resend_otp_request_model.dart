import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_otp_request_model.freezed.dart';
part 'resend_otp_request_model.g.dart';

@freezed
class ResendOtpRequestModel with _$ResendOtpRequestModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory ResendOtpRequestModel({
    required String phoneNumber,
    required String recaptchaToken,
  }) = _ResendOtpRequestModel;

  factory ResendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestModelFromJson(json);
}