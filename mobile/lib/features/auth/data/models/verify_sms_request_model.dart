import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_sms_request_model.freezed.dart';
part 'verify_sms_request_model.g.dart';

@freezed
class VerifySmsRequestModel with _$VerifySmsRequestModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory VerifySmsRequestModel({
    required String phoneNumber,
    required String otp,
  }) = _VerifySmsRequestModel;

  factory VerifySmsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsRequestModelFromJson(json);
}