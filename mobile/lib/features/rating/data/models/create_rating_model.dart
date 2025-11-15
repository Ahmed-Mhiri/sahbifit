import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_rating_model.freezed.dart';
part 'create_rating_model.g.dart';


@freezed
abstract class CreateRatingModel with _$CreateRatingModel {
  
  const factory CreateRatingModel({
    required String sessionId,
    required String ratedUserId,
    required int ratingValue, // 'Short' maps to 'int'
    String? comment,
  }) = _CreateRatingModel;

  factory CreateRatingModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRatingModelFromJson(json);
}
