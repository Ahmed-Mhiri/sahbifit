import 'package:equatable/equatable.dart';
import 'package:sahbifit_mobile/features/gym/domain/enums/gym_status.dart';
import '../../domain/entities/gym.dart'; // We will create this

class GymModel extends Gym {
  const GymModel({
    required super.id,
    required super.name,
    required super.address,
    required super.memberCount,
    required this.status, // The model has status, the entity might not
  });

  final GymStatus status;

  factory GymModel.fromJson(Map<String, dynamic> json) {
    return GymModel(
      // Matches gymId from Gym.java
      id: json['gymId'] as String, 
      
      // Matches name from Gym.java
      name: json['name'] as String, 
      
      // Matches address from Gym.java
      address: json['address'] as String? ?? '', 
      
      // Matches @Formula memberCount from Gym.java
      // This directly implements MVP 6.2
      memberCount: json['memberCount'] as int, 
      
      // Matches status from Gym.java
      status: (json['status'] as String).toGymStatus(),
    );
  }

  // Helper to convert string to enum
}

extension on String {
  GymStatus toGymStatus() {
    switch (this) {
      case 'pending':
        return GymStatus.pending;
      case 'approved':
        return GymStatus.approved;
      case 'rejected':
        return GymStatus.rejected;
      default:
        return GymStatus.pending; // Default fallback
    }
  }
}