import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/domain/entities/gym_status.dart';

part 'gym_model.freezed.dart';
part 'gym_model.g.dart';

@freezed
class GymModel with _$GymModel {
  const GymModel._(); // Private constructor for methods

  @JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true) // <-- ADD THIS
  const factory GymModel({
    required String gymId,
    required String name,
    String? address,
    required GymStatus status,
    required int memberCount,
  }) = _GymModel;

  factory GymModel.fromJson(Map<String, dynamic> json) =>
      _$GymModelFromJson(json);

  // Converts the data-layer model to a domain-layer entity
  Gym toEntity() {
    return Gym(
      gymId: gymId,
      name: name,
      address: address,
      status: status,
      memberCount: memberCount,
    );
  }
}