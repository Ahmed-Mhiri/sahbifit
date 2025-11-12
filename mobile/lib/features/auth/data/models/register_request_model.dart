import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory RegisterRequestModel({
    required String phoneNumber,
    required String password,
    required String recaptchaToken,
    required String firstName,
    required String dateOfBirth, // Send as "YYYY-MM-DD" string
    required String primaryGymId, // Send the UUID as a String
    String? profilePhotoUrl, // Optional
    required List<int> goalTagIds,
    required List<int> scheduleTagIds,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}