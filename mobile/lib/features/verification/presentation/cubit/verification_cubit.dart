import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_verification_status.dart';
import '../../domain/usecases/submit_verification_video.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final GetVerificationStatus getVerificationStatus;
  final SubmitVerificationVideo submitVerificationVideo;

  VerificationCubit({
    required this.getVerificationStatus,
    required this.submitVerificationVideo,
  }) : super(VerificationInitial());

  // Call this when the user enters the verification page or pulls to refresh
  Future<void> fetchStatus() async {
    emit(VerificationLoading());
    try {
      final statusModel = await getVerificationStatus();
      emit(VerificationStatusLoaded(statusModel));
    } catch (e) {
      emit(VerificationError(e.toString()));
    }
  }

  // Call this from the UI (e.g., VideoRecorderWidget)
  Future<void> submitVideo(String videoPath) async {
    emit(VerificationLoading());
    try {
      final message = await submitVerificationVideo(videoPath);
      
      // Show success message temporarily
      emit(VerificationSubmissionSuccess(message));
      
      // IMPORTANT: After submission,
      // immediately fetch the new status (which should be 'pending_review')
      await fetchStatus();
      
    } catch (e) {
      emit(VerificationError(e.toString()));
    }
  }
}