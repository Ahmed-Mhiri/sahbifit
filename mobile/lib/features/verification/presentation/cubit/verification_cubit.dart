import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/errors/failure.dart';
import 'package:sahbifit/core/usecases/usecase.dart';
import 'package:sahbifit/features/verification/domain/entities/verification_status_entity.dart';
import 'package:sahbifit/features/verification/domain/usecases/get_verification_status.dart';
import 'package:sahbifit/features/verification/domain/usecases/submit_verification_video.dart';

part 'verification_cubit.freezed.dart';
part 'verification_state.dart';

@injectable
class VerificationCubit extends Cubit<VerificationState> {
  final GetVerificationStatus _getVerificationStatus;
  final SubmitVerificationVideo _submitVerificationVideo;

  VerificationCubit(
    this._getVerificationStatus,
    this._submitVerificationVideo,
  ) : super(const VerificationState.initial());

  /// Fetches the user's current verification status from the server.
  /// This is called from main.dart on app start.
  Future<void> fetchStatus() async {
    emit(const VerificationState.loading());
    try {
      final status = await _getVerificationStatus(NoParams());
      emit(VerificationState.loaded(status));
    } on ServerFailure catch (e) {
      emit(VerificationState.error(e.message));
    } catch (e) {
      emit(VerificationState.error(e.toString()));
    }
  }

  /// Submits the verification video.
  /// On success, it immediately re-fetches the status to update
  /// the state from 'not_started' to 'pending_review'.
  Future<void> submitVideo(File video) async {
    emit(const VerificationState.loading());
    try {
      final params = SubmitVerificationVideoParams(video: video);
      await _submitVerificationVideo(params);

      // On success, refresh the status
      await fetchStatus();
    } on ServerFailure catch (e) {
      emit(VerificationState.error(e.message));
    } catch (e) {
      emit(VerificationState.error(e.toString()));
    }
  }
}