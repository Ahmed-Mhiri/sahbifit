import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String phoneNumber;
  final String password;
  final String recaptchaToken;
  final String firstName;
  final String dateOfBirth;
  final String primaryGymId;
  final String? profilePhotoUrl;
  final List<int> goalTagIds;
  final List<int> scheduleTagIds;

  RegisterRequestModel({
    required this.phoneNumber,
    required this.password,
    required this.recaptchaToken,
    required this.firstName,
    required this.dateOfBirth,
    required this.primaryGymId,
    this.profilePhotoUrl,
    required this.goalTagIds,
    required this.scheduleTagIds,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}