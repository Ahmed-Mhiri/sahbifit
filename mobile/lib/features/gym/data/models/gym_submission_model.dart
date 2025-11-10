import 'package:equatable/equatable.dart';

class GymSubmissionModel extends Equatable {
  final String name;
  final String address;

  const GymSubmissionModel({
    required this.name,
    required this.address,
  });

  // Creates the JSON body for the POST request
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }

  @override
  List<Object?> get props => [name, address];
}