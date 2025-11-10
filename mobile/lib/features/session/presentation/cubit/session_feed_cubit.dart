import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit_mobile/features/session/domain/usecases/get_active_sessions.dart';
import 'package:sahbifit_mobile/features/session/presentation/cubit/session_feed_state.dart';
import 'package:sahbifit_mobile/features/verification/domain/enums/verified_gender_enum.dart';

class SessionFeedCubit extends Cubit<SessionFeedState> {
  final GetActiveSessions _getActiveSessions;

  SessionFeedCubit(this._getActiveSessions)
      : super(const SessionFeedState.initial());

  /// Fetches the active sessions from the repository.
  Future<void> fetchActiveSessions({VerifiedGender? genderFilter}) async {
    emit(const SessionFeedState.loading());

    final params = GetActiveSessionsParams(genderFilter: genderFilter);
    final result = await _getActiveSessions(params);

    result.fold(
      // On Failure
      (failure) => emit(SessionFeedState.failure(failure.message)),
      // On Success
      (sessions) => emit(SessionFeedState.success(sessions)),
    );
  }
}