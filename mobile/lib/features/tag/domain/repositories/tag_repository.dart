import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';

abstract class TagRepository {
  Future<List<Tag>> getTagsByType(TagType type);
}