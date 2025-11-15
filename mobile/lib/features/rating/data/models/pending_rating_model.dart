import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/rating/domain/entities/pending_rating.dart';

part 'pending_rating_model.freezed.dart';
part 'pending_rating_model.g.dart';


@freezed
abstract class PendingRatingModel with _$PendingRatingModel {
  const PendingRatingModel._();

  
  const factory PendingRatingModel({
    required String sessionId,
    required String sessionTitle,
    required String userIdToRate,
    required String userNameToRate,
  }) = _PendingRatingModel;

  factory PendingRatingModel.fromJson(Map<String, dynamic> json) =>
      _$PendingRatingModelFromJson(json);

  PendingRating toEntity() {
    return PendingRating(
      sessionId: sessionId,
      sessionTitle: sessionTitle,
      userIdToRate: userIdToRate,
      userNameToRate: userNameToRate,
    );
  }
}
