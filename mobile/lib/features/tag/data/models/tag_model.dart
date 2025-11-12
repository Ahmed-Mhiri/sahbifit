import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/tag/domain/entities/tag.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
class TagModel with _$TagModel {
  const TagModel._(); // Private constructor for methods

  @JsonSerializable(fieldRename: FieldRename.none)
  const factory TagModel({
    required int tagId,
    required String tagName,
    required TagType tagType,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  // Converts the data-layer model to a domain-layer entity
  Tag toEntity() {
    return Tag(
      tagId: tagId,
      tagName: tagName,
      tagType: tagType,
    );
  }
}