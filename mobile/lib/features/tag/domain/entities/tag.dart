import 'package:equatable/equatable.dart';
import 'enums/tag_type.dart';

/// Domain entity for a Tag.
/// This is the object used by the UI (Presentation) layer.
class Tag extends Equatable {
  /// Note: This is a [String] to match the `tag_selection_widget`
  /// which uses `List<String> selectedTags`.
  final String id;
  final String name;
  final TagType type;

  const Tag({
    required this.id,
    required this.name,
    required this.type,
  });

  @override
  List<Object?> get props => [id, name, type];
}