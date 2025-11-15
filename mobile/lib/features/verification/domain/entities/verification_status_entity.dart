import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

// This is the clean object based on VerificationStatusDto.java
class VerificationStatusEntity extends Equatable {
  final VerificationStatus status;
  final VerifiedGender gender;

  const VerificationStatusEntity({
    required this.status,
    required this.gender,
  });

  @override
  List<Object?> get props => [status, gender];
}
