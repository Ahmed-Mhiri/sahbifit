import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/rating/domain/entities/rating.dart';
import 'package:sahbifit/features/session/data/models/session_summary_model.dart';
import 'package:sahbifit/features/user/data/models/user_summary_model.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
abstract class RatingModel with _$RatingModel {
  const RatingModel._();

  const factory RatingModel({
    required String ratingId,
    required UserSummaryModel ratingBy,
    required UserSummaryModel ratingFor,
    required SessionSummaryModel session,
    required int ratingValue,
    String? comment,
    required String createdAt,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Rating toEntity() {
    return Rating(
      ratingId: ratingId,
      sessionId: session.sessionId,
      ratingBy: ratingBy.toEntity(),
      ratingFor: ratingFor.toEntity(),
      ratingValue: ratingValue,
      comment: comment,
      createdAt: DateTime.parse(createdAt),
    );
  }
}