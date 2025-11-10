import 'package:equatable/equatable.dart';
import '../domain/entities/tag.dart';
import '../domain/enums/tag_type.dart';

/// Data Transfer Object (DTO) for a Tag.
/// This model directly maps to the JSON response from the backend.
class TagModel extends Equatable {
  final int tagId;
  final String tagName;
  final TagType tagType;

  const TagModel({
    required this.tagId,
    required this.tagName,
    required this.tagType,
  });

  /// Creates a [TagModel] from a JSON map.
  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      tagId: json['tagId'] as int,
      tagName: json['tagName'] as String,
      // Handle the enum deserialization
      tagType: (json['tagType'] as String).toTagType(),
    );
  }

  /// Converts the Data-layer [TagModel] to a Domain-layer [Tag] entity.
  /// This is where we convert `tagId` (int) to `id` (String) for the UI.
  Tag toEntity() {
    return Tag(
      id: tagId.toString(),
      name: tagName,
      type: tagType,
    );
  }

  @override
  List<Object?> get props => [tagId, tagName, tagType];
}

/// Helper extension to convert string from API to [TagType] enum.
extension on String {
  TagType toTagType() {
    return TagType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => TagType.goal, // Default fallback
    );
  }
}