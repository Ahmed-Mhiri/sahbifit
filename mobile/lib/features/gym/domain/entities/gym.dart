import 'package:equatable/equatable.dart';

class Gym extends Equatable {
  final String id;
  final String name;
  final String address;
  final int memberCount; // For MVP 6.2

  const Gym({
    required this.id,
    required this.name,
    required this.address,
    required this.memberCount,
  });

  @override
  List<Object?> get props => [id, name, address, memberCount];
}