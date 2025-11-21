import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/session/domain/repositories/session_repository.dart';
import 'my_sessions_state.dart';

@injectable
class MySessionsCubit extends Cubit<MySessionsState> {
  final SessionRepository sessionRepository;

  MySessionsCubit({required this.sessionRepository}) : super(MySessionsInitial());

  Future<void> loadMySessions() async {
    emit(MySessionsLoading());

    try {
      // 1. Fetch sessions directly (No .fold here!)
      final sessions = await sessionRepository.getMySessions();
      final now = DateTime.now();

      // 2. Process Upcoming Sessions
      final upcoming = sessions
          .where((s) => s.startTime.isAfter(now))
          .toList();

      // Sort Ascending (Earliest date first)
      upcoming.sort((a, b) => a.startTime.compareTo(b.startTime));

      // 3. Process Past Sessions
      final history = sessions
          .where((s) => s.startTime.isBefore(now))
          .toList();

      // Sort Descending (Newest date first)
      history.sort((a, b) => b.startTime.compareTo(a.startTime));

      emit(MySessionsLoaded(
        upcomingSessions: upcoming,
        pastSessions: history,
      ));

    } on ServerFailure catch (e) {
      // 4. Catch specific server errors
      emit(MySessionsError(e.message));
    } catch (e) {
      // 5. Catch unexpected errors
      emit(MySessionsError("Failed to load sessions: ${e.toString()}"));
    }
  }
}