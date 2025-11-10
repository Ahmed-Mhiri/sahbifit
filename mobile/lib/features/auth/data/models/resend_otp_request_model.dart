import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request_model.g.dart';

@JsonSerializable()
class ResendOtpRequestModel {
  final String phoneNumber;
  final String recaptchaToken;

  ResendOtpRequestModel({
    required this.phoneNumber,
    required this.recaptchaToken,
  });

  factory ResendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpRequestModelToJson(this);
}