// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_sms_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifySmsRequestModelImpl _$$VerifySmsRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$VerifySmsRequestModelImpl(
  phoneNumber: json['phoneNumber'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$$VerifySmsRequestModelImplToJson(
  _$VerifySmsRequestModelImpl instance,
) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'otp': instance.otp,
};
