import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/features/session/data/models/session_participant_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/features/session/domain/usecases/get_active_sessions.dart';
import 'package:sahbifit/features/session/domain/usecases/mark_attendance.dart';

part 'mark_attendance_cubit.freezed.dart';
part 'mark_attendance_state.dart';

@injectable
class MarkAttendanceCubit extends Cubit<MarkAttendanceState> {
  final GetActiveSessions _getActiveSessions;
  final MarkAttendance _markAttendance;
  final FirebaseFirestore _firestore;

  StreamSubscription? _participantsSubscription;

  MarkAttendanceCubit(
    this._getActiveSessions,
    this._markAttendance,
    this._firestore,
  ) : super(const MarkAttendanceState.initial());

  Future<void> loadSession(String sessionId) async {
    emit(const MarkAttendanceState.loading());
    try {
      // 1. Fetch base session data
      final sessions = await _getActiveSessions(const GetActiveSessionsParams());
      final session = sessions.firstWhere((s) => s.sessionId == sessionId);

      // 2. Listen for participants
      _participantsSubscription?.cancel();
      _participantsSubscription = _firestore
          .collection('sessions')
          .doc(sessionId)
          .collection('participants')
          .snapshots()
          .listen((snapshot) {
        final participants = snapshot.docs
            .map((doc) => SessionParticipantModel.fromJson(doc.data()).toEntity())
            .toList();
        emit(MarkAttendanceState.loaded(
          session: session,
          participants: participants,
        ));
      });
    } on ServerFailure catch (e) {
      emit(MarkAttendanceState.error(e.message));
    } catch (e) {
      emit(MarkAttendanceState.error(e.toString()));
    }
  }

  Future<void> submitAttendance(String userId, ParticipantStatus status) async {
    final currentState = state;
    if (currentState is _Loaded) {
      emit(currentState.copyWith(isSubmitting: true));
      try {
        await _markAttendance(MarkAttendanceParams(
          sessionId: currentState.session.sessionId,
          userId: userId,
          status: status,
        ));
        // The stream will refresh the list, so we just stop loading
        emit(currentState.copyWith(isSubmitting: false));
      } on ServerFailure catch (e) {
        // Show error on the loaded state
        emit(currentState.copyWith(isSubmitting: false, errorMessage: e.message));
        // Clear error after a few seconds
        await Future.delayed(const Duration(seconds: 3));
        emit(currentState.copyWith(errorMessage: null));
      }
    }
  }

  @override
  Future<void> close() {
    _participantsSubscription?.cancel();
    return super.close();
  }
}
