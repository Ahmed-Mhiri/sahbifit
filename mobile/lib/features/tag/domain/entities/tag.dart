import 'package:equatable/equatable.dart';
import 'package:sahbifit/features/tag/domain/entities/tag_type.dart';

class Tag extends Equatable {
  final int tagId;
  final String tagName;
  final TagType tagType;

  const Tag({
    required this.tagId,
    required this.tagName,
    required this.tagType,
  });

  @override
  List<Object?> get props => [tagId, tagName, tagType];
}
