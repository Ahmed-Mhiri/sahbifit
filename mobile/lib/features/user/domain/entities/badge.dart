import 'package:equatable/equatable.dart';

// Matches Badge.java
class Badge extends Equatable {
  final int badgeId;
  final String badgeName;
  final String description;
  final String? iconUrl;

  const Badge({
    required this.badgeId,
    required this.badgeName,
    required this.description,
    this.iconUrl,
  });

  @override
  List<Object?> get props => [badgeId, badgeName, description, iconUrl];
}