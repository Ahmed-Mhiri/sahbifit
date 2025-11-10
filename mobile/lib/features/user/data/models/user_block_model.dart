import 'package:equatable/equatable.dart';

// Model based on the UserBlock.java entity,
// likely used for a "Blocked Users" list screen.
class UserBlockModel extends Equatable {
  final String blockerUserId;
  final String blockedUserId;
  final DateTime createdAt;

  const UserBlockModel({
    required this.blockerUserId,
    required this.blockedUserId,
    required this.createdAt,
  });

  factory UserBlockModel.fromJson(Map<String, dynamic> json) {
    // Assumes the backend returns an object with this structure
    return UserBlockModel(
      blockerUserId: json['blocker']['userId'],
      blockedUserId: json['blocked']['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  List<Object?> get props => [blockerUserId, blockedUserId];
}