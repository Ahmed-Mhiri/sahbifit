import 'package:freezed_annotation/freezed_annotation.dart';
part 'gym_submission_model.freezed.dart';
part 'gym_submission_model.g.dart';

@freezed
class GymSubmissionModel with _$GymSubmissionModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory GymSubmissionModel({
    required String name,
    required String address,
  }) = _GymSubmissionModel;

  factory GymSubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$GymSubmissionModelFromJson(json);
}