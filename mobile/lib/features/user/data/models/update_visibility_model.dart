import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/user/domain/enums/profile_visibility.dart';

part 'update_visibility_model.freezed.dart';
part 'update_visibility_model.g.dart';

// Matches UpdateVisibilityDto.java
@freezed
class UpdateVisibilityModel with _$UpdateVisibilityModel {
  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory UpdateVisibilityModel({
    required ProfileVisibility visibility,
  }) = _UpdateVisibilityModel;

  factory UpdateVisibilityModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateVisibilityModelFromJson(json);
}