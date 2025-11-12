import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/verification/domain/entities/verification_status_entity.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

part 'verification_status_model.freezed.dart';
part 'verification_status_model.g.dart';

// Matches VerificationStatusDto.java
@freezed
class VerificationStatusModel with _$VerificationStatusModel {
  const VerificationStatusModel._();

  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory VerificationStatusModel({
    required VerificationStatus status,
    required VerifiedGender gender,
  }) = _VerificationStatusModel;

  factory VerificationStatusModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationStatusModelFromJson(json);

  // Converts the data-layer model to a domain-layer entity
  VerificationStatusEntity toEntity() {
    return VerificationStatusEntity(
      status: status,
      gender: gender,
    );
  }
}