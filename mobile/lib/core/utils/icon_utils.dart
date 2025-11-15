import 'package:flutter/material.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';


// Assuming your enums are defined in your domain models.
// Example: enum SessionType { group, one_on_one }
// Example: enum VerifiedGender { not_verified, male, female, other }

/// Returns an icon based on the session type.
IconData getSessionTypeIcon(SessionType type) {
  switch (type) {
    case SessionType.group:
      return Icons.groups_rounded;
    case SessionType.oneOnOne:
      return Icons.person_rounded;
  }
}

/// Returns an icon based on the user's verified gender.
IconData getGenderIcon(VerifiedGender gender) {
  switch (gender) {
    case VerifiedGender.male:
      return Icons.male_rounded;
    case VerifiedGender.female:
      return Icons.female_rounded;
    case VerifiedGender.other:
      return Icons.transgender_rounded;
    case VerifiedGender.notVerified:
      return Icons.help_outline_rounded;
  }
}