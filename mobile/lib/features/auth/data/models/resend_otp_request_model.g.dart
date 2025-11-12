// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResendOtpRequestModelImpl _$$ResendOtpRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ResendOtpRequestModelImpl(
  phoneNumber: json['phoneNumber'] as String,
  recaptchaToken: json['recaptchaToken'] as String,
);

Map<String, dynamic> _$$ResendOtpRequestModelImplToJson(
  _$ResendOtpRequestModelImpl instance,
) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'recaptchaToken': instance.recaptchaToken,
};
