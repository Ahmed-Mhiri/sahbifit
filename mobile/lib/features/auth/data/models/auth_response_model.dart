import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahbifit/features/auth/domain/entities/auth_token.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const AuthResponseModel._(); // Private constructor for methods

  @JsonSerializable(fieldRename: FieldRename.none)
  const factory AuthResponseModel({
    required String jwtToken,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  // Converts the data-layer model to a domain-layer entity
  AuthToken toEntity() {
    return AuthToken(token: jwtToken);
  }
}