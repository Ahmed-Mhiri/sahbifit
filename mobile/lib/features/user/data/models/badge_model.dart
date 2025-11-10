import 'package:sahbifit/features/user/domain/entities/badge.dart';

class BadgeModel extends Badge {
  const BadgeModel({
    required super.id,
    required super.name,
    required super.description,
    super.iconUrl,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      id: json['badgeId'],
      name: json['badgeName'],
      description: json['description'],
      iconUrl: json['iconUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'badgeId': id,
      'badgeName': name,
      'description': description,
      'iconUrl': iconUrl,
    };
  }
}