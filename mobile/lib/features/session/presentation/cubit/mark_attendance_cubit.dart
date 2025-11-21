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
  final GetSessionById _getSessionById;
  final MarkAttendance _markAttendance;
  // Update Type
  final GetSessionParticipants _getSessionParticipants;

  // Remove StreamSubscription? _participantsSubscription;

  MarkAttendanceCubit(
      this._getSessionById,
      this._markAttendance,
      this._getSessionParticipants, // Update Injection
      ) : super(const MarkAttendanceState.initial());

  Future<void> loadSession(String sessionId) async {
    emit(const MarkAttendanceState.loading());
    try {
      // 1. Fetch base session data
      final session = await _getSessionById(GetSessionByIdParams(sessionId: sessionId));

      // 2. Fetch participants (Once, not stream)
      final participants = await _getSessionParticipants(
        GetSessionParticipantsParams(sessionId: session.sessionId),
      );

      // 3. Emit loaded
      emit(MarkAttendanceState.loaded(
        session: session,
        participants: participants,
      ));

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

        // REFRESH DATA MANUALLY AFTER SUBMISSION
        // Since we lost the stream, we must re-fetch to show updated status
        final updatedParticipants = await _getSessionParticipants(
            GetSessionParticipantsParams(sessionId: currentState.session.sessionId)
        );

        emit(currentState.copyWith(
            isSubmitting: false,
            participants: updatedParticipants // Update list
        ));

      } on ServerFailure catch (e) {
        emit(currentState.copyWith(isSubmitting: false, errorMessage: e.message));
        await Future.delayed(const Duration(seconds: 3));
        emit(currentState.copyWith(errorMessage: null));
      }
    }
  }

// Remove @override Future<void> close() since there is no subscription
}