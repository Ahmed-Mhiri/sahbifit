import 'package:equatable/equatable.dart';

// NOTE: The BadgeType enum has been removed.
// The backend provides the name (e.g., "RELIABLE") and iconUrl directly.

class Badge extends Equatable {
  final int id;
  final String name; // This will map to 'badgeName' from the backend
  final String description;
  final String? iconUrl;

  const Badge({
    required this.id,
    required this.name,
    required this.description,
    this.iconUrl,
  });

  @override
  List<Object?> get props => [id, name, description, iconUrl];
}