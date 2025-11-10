import 'package:json_annotation/json_annotation.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verified_gender_enum.dart';


part 'verification_status_model.g.dart';

@JsonSerializable()
class VerificationStatusModel {
  @JsonKey(name: 'status')
  final VerificationStatus status;
  
  @JsonKey(name: 'gender')
  final VerifiedGender gender;

  VerificationStatusModel({
    required this.status,
    required this.gender,
  });

  factory VerificationStatusModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationStatusModelToJson(this);
}