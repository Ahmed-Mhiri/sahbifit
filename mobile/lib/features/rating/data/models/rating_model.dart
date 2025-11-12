import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/rating/domain/entities/rating.dart';
import 'package:sahbifit/features/user/data/models/user_model.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

// Helper model to represent the nested 'session' object
// We only extract the ID, as seen in the Rating entity
@freezed
class RatingSessionModel with _$RatingSessionModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory RatingSessionModel({
    required String sessionId,
  }) = _RatingSessionModel;

  factory RatingSessionModel.fromJson(Map<String, dynamic> json) =>
      _$RatingSessionModelFromJson(json);
}


@freezed
class RatingModel with _$RatingModel {
  const RatingModel._();

  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory RatingModel({
    required String ratingId,
    required RatingSessionModel session, // Nested session object
    required UserModel ratingBy,
    required UserModel ratingFor,
    required int ratingValue,
    String? comment,
    required String createdAt, // Receive as ISO 8601 String
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Rating toEntity() {
    return Rating(
      ratingId: ratingId,
      sessionId: session.sessionId, // Extract the ID
      ratingBy: ratingBy.toEntity(),
      ratingFor: ratingFor.toEntity(),
      ratingValue: ratingValue,
      comment: comment,
      createdAt: DateTime.parse(createdAt), // Convert String to DateTime
    );
  }
}