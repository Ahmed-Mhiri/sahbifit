import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/auth/data/models/register_request_model.dart';
import 'package:sahbifit/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUser implements UseCase<void, RegisterParams> {
  final AuthRepository _repository;

  RegisterUser(this._repository);

  @override
  Future<void> call(RegisterParams params) async {
    // The Usecase maps the simple params into the data model
    final requestModel = RegisterRequestModel(
      phoneNumber: params.phoneNumber,
      password: params.password,
      recaptchaToken: params.recaptchaToken,
      firstName: params.firstName,
      dateOfBirth: params.dateOfBirth,
      primaryGymId: params.primaryGymId,
      goalTagIds: params.goalTagIds,
      scheduleTagIds: params.scheduleTagIds,
      profilePhotoUrl: params.profilePhotoUrl,
    );
    return _repository.register(requestModel);
  }
}

class RegisterParams extends Equatable {
  final String phoneNumber;
  final String password;
  final String recaptchaToken;
  final String firstName;
  final String dateOfBirth;
  final String primaryGymId;
  final List<int> goalTagIds;
  final List<int> scheduleTagIds;
  final String? profilePhotoUrl;

  const RegisterParams({
    required this.phoneNumber,
    required this.password,
    required this.recaptchaToken,
    required this.firstName,
    required this.dateOfBirth,
    required this.primaryGymId,
    required this.goalTagIds,
    required this.scheduleTagIds,
    this.profilePhotoUrl,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        recaptchaToken,
        firstName,
        dateOfBirth,
        primaryGymId,
        goalTagIds,
        scheduleTagIds,
        profilePhotoUrl,
      ];
}