import 'package:json_annotation/json_annotation.dart';

part 'verify_sms_request_model.g.dart';

@JsonSerializable()
class VerifySmsRequestModel {
  final String phoneNumber;
  final String otp;

  VerifySmsRequestModel({
    required this.phoneNumber,
    required this.otp,
  });

  factory VerifySmsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySmsRequestModelToJson(this);
}