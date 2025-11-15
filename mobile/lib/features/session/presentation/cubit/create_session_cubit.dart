import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/session/domain/usecases/create_session.dart';

part 'create_session_cubit.freezed.dart';
part 'create_session_state.dart';

@injectable
class CreateSessionCubit extends Cubit<CreateSessionState> {
  final CreateSession _createSession;

  CreateSessionCubit(this._createSession)
      : super(CreateSessionState.initial(
          // Default to 1 hour from now, duration 1 hour
          startTime: DateTime.now().add(const Duration(hours: 1)),
          endTime: DateTime.now().add(const Duration(hours: 2)),
        ));

  void titleChanged(String title) {
    emit(state.copyWith(title: title, status: CreateSessionStatus.initial, errorMessage: null));
  }

  void gymChanged(Gym gym) {
    emit(state.copyWith(selectedGym: gym, status: CreateSessionStatus.initial, errorMessage: null));
  }

  void sessionTypeChanged(SessionType type) {
    emit(state.copyWith(sessionType: type, status: CreateSessionStatus.initial, errorMessage: null));
  }

  void startTimeChanged(DateTime time) {
    emit(state.copyWith(startTime: time, status: CreateSessionStatus.initial, errorMessage: null));
  }

  void endTimeChanged(DateTime time) {
    emit(state.copyWith(endTime: time, status: CreateSessionStatus.initial, errorMessage: null));
  }

  void maxParticipantsChanged(int count) {
    emit(state.copyWith(maxParticipants: count, status: CreateSessionStatus.initial, errorMessage: null));
  }

  Future<void> submitCreateSession() async {
    if (state.selectedGym == null || state.title.trim().isEmpty) {
      emit(state.copyWith(
          status: CreateSessionStatus.error,
          errorMessage: 'Title and Gym are required.'));
      return;
    }

    if (state.endTime.isBefore(state.startTime.add(const Duration(minutes: 30)))) {
       emit(state.copyWith(
          status: CreateSessionStatus.error,
          errorMessage: 'End time must be at least 30 minutes after start time.'));
      return;
    }

    emit(state.copyWith(status: CreateSessionStatus.loading, errorMessage: null));
    try {
      final params = CreateSessionParams(
        gymId: state.selectedGym!.gymId,
        sessionType: state.sessionType,
        title: state.title.trim(),
        startTime: state.startTime,
        endTime: state.endTime,
        maxParticipants: state.maxParticipants,
      );
      final session = await _createSession(params);
      emit(state.copyWith(
          status: CreateSessionStatus.success, createdSession: session));
    } on ServerFailure catch (e) {
      emit(
          state.copyWith(status: CreateSessionStatus.error, errorMessage: e.message));
    } catch(e) {
       emit(
          state.copyWith(status: CreateSessionStatus.error, errorMessage: e.toString()));
    }
  }
}
