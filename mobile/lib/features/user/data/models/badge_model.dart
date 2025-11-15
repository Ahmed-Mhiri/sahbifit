import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/user/domain/entities/badge.dart';

part 'badge_model.freezed.dart';
part 'badge_model.g.dart';


@freezed
abstract class BadgeModel with _$BadgeModel {
  const BadgeModel._();

  
  const factory BadgeModel({
    required int badgeId,
    required String badgeName,
    required String description,
    String? iconUrl,
  }) = _BadgeModel;

  factory BadgeModel.fromJson(Map<String, dynamic> json) =>
      _$BadgeModelFromJson(json);

  Badge toEntity() {
    return Badge(
      badgeId: badgeId,
      badgeName: badgeName,
      description: description,
      iconUrl: iconUrl,
    );
  }
}
