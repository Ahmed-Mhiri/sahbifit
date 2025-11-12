import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/gym/domain/entities/gym_status.dart';

class Gym extends Equatable {
  final String gymId;
  final String name;
  final String? address;
  final GymStatus status;
  final int memberCount; // From the @Formula in Gym.java

  const Gym({
    required this.gymId,
    required this.name,
    this.address,
    required this.status,
    required this.memberCount,
  });

  @override
  List<Object?> get props => [gymId, name, address, status, memberCount];
}