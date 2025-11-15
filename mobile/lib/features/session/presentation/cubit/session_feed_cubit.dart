import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/usecases/get_active_sessions.dart';
import 'package:sahbifit/features/verification/domain/enums/verified_gender_enum.dart';

part 'session_feed_cubit.freezed.dart';
part 'session_feed_state.dart';

@injectable
class SessionFeedCubit extends Cubit<SessionFeedState> {
  final GetActiveSessions _getActiveSessions;

  SessionFeedCubit(this._getActiveSessions)
      : super(const SessionFeedState.initial());

  /// Fetches the list of active sessions, optionally applying a gender filter.
  Future<void> fetchSessions({VerifiedGender? genderFilter}) async {
    emit(const SessionFeedState.loading());
    try {
      final params = GetActiveSessionsParams(genderFilter: genderFilter);
      final sessions = await _getActiveSessions(params);

      emit(SessionFeedState.loaded(
        sessions: sessions,
        genderFilter: genderFilter,
      ));
    } on ServerFailure catch (e) {
      emit(SessionFeedState.error(e.message));
    } catch (e) {
      emit(SessionFeedState.error(e.toString()));
    }
  }
}
