import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/gym/domain/entities/gym_submission.dart';
import 'package:sahbifit/features/gym/domain/usecases/submit_gym.dart';

part 'submit_gym_cubit.freezed.dart';
part 'submit_gym_state.dart';

@injectable
class SubmitGymCubit extends Cubit<SubmitGymState> {
  final SubmitGym _submitGym;

  SubmitGymCubit(this._submitGym) : super(const SubmitGymState.initial());

  /// Submits a new gym for approval.
  Future<void> submitGym(String name, String address) async {
    emit(const SubmitGymState.loading());
    try {
      final submission = GymSubmission(name: name, address: address);
      await _submitGym(submission);
      emit(const SubmitGymState.success());
    } on ServerFailure catch (e) {
      emit(SubmitGymState.error(e.message));
    } catch (e) {
      emit(SubmitGymState.error('An unexpected error occurred: $e'));
    }
  }
}
