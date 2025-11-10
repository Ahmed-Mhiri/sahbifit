import 'package:equatable/equatable.dart';
import '../../domain/entities/profile_visibility.dart';

// DTO for updating visibility, based on UpdateVisibilityDto.java
class UpdateVisibilityModel extends Equatable {
  final ProfileVisibility visibility;

  const UpdateVisibilityModel({required this.visibility});

  Map<String, dynamic> toJson() {
    // Convert enum to the backend's expected string format
    final String visibilityString =
        visibility == ProfileVisibility.sameGender ? 'same_gender' : 'all';
    return {
      'visibility': visibilityString,
    };
  }

  @override
  List<Object?> get props => [visibility];
}