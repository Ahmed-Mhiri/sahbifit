import 'package:sahbifit/features/user/data/models/badge_model.dart';
import 'package:equatable/equatable.dart';

// This model represents the UserBadge.java join entity.
class UserBadgeModel extends Equatable {
  final String userId;
  final int badgeId; // Changed from String to int
  final DateTime earnedAt;
  final BadgeModel badge; // Nested badge details

  const UserBadgeModel({
    required this.userId,
    required this.badgeId,
    required this.earnedAt,
    required this.badge,
  });

  factory UserBadgeModel.fromJson(Map<String, dynamic> json) {
    return UserBadgeModel(
      // Assumes the composite ID fields are flattened or available
      userId: json['id']?['userId'] ?? json['user']?['userId'],
      badgeId: json['id']?['badgeId'] ?? json['badge']?['badgeId'],
      earnedAt: DateTime.parse(json['earnedAt']),
      badge: BadgeModel.fromJson(json['badge']),
    );
  }

  @override
  List<Object?> get props => [userId, badgeId, earnedAt, badge];
}