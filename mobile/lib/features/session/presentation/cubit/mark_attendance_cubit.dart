// lib/features/session/presentation/cubit/mark_attendance_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
// --- REMOVED ---
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
// --- REMOVED ---
// import 'package:sahbifit/features/session/data/models/session_participant_model.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
// --- ADDED ---
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
// --- ADDED ---
import 'package:sahbifit/features/session/domain/usecases/get_participants_stream.dart';
import 'package:sahbifit/features/session/domain/usecases/mark_attendance.dart';
// --- ADDED ---
import 'package:sahbifit/features/session/domain/usecases/get_session_by_id.dart';

part 'mark_attendance_cubit.freezed.dart';
part 'mark_attendance_state.dart';

@injectable
class MarkAttendanceCubit extends Cubit<MarkAttendanceState> {
  // --- ADDED ---
  final GetSessionById _getSessionById;
  final MarkAttendance _markAttendance;
  // --- REMOVED ---
  // final FirebaseFirestore _firestore;
  // --- ADDED ---
  final GetParticipantsStream _getParticipantsStream;

  StreamSubscription? _participantsSubscription;

  MarkAttendanceCubit(
    // --- ADDED ---
    this._getSessionById,
    this._markAttendance,
    // --- REMOVED ---
    // this._firestore,
    // --- ADDED ---
    this._getParticipantsStream,
  ) : super(const MarkAttendanceState.initial());

  Future<void> loadSession(String sessionId) async { // <-- CHANGED SIGNATURE
    emit(const MarkAttendanceState.loading());
    try {
      // 1. Fetch base session data
      final session =
          await _getSessionById(GetSessionByIdParams(sessionId: sessionId));

      // 2. Listen for participants
      _participantsSubscription?.cancel();
      _participantsSubscription = _getParticipantsStream(
        GetParticipantsStreamParams(sessionId: session.sessionId),
      ).listen((participants) {
        emit(MarkAttendanceState.loaded(
          session: session, // <-- Use newly fetched session
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
    // ... (rest of the method is unchanged) ...
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
        emit(
            currentState.copyWith(isSubmitting: false, errorMessage: e.message));
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