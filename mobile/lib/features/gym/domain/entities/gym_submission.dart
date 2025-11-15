import 'package:equatable/equatable.dart';

class GymSubmission extends Equatable {
  final String name;
  final String address;

  const GymSubmission({required this.name, required this.address});

  @override
  List<Object?> get props => [name, address];
}
