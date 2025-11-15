import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/features/verification/presentation/cubit/verification_cubit.dart';
import 'package:sahbifit/features/verification/presentation/widgets/video_recorder_widget.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/features/verification/presentation/widgets/verification_success_dialog.dart';

class SubmitVerificationPage extends StatelessWidget {
  const SubmitVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Verify Your Profile'),
      body: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (status) {
              // When submission is successful, the cubit refetches.
              // If the new status is pending, show success and pop.
              if (status.status == VerificationStatus.pendingReview) {
                // Show the success dialog
                VerificationSuccessDialog.show(context);
                // Pop this page using GoRouter
                context.pop();
              }
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () =>
                const LoadingIndicator(message: 'Submitting your video...'),
            orElse: () => _buildInstructions(context, textTheme),
          );
        },
      ),
    );
  }

  Widget _buildInstructions(BuildContext context, TextTheme textTheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Start Verification',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'To keep our community safe, please record a short 5-second video.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(13),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withAlpha(51),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please say the following phrase clearly:',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '"Hi, my name is [Your Name] and today is [Today\'s Date]."',
                  style: textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'After, please turn your head to the side.',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          VideoRecorderWidget(
            onVideoRecorded: (File videoFile) {
              // Call the cubit to submit the video
              context.read<VerificationCubit>().submitVideo(videoFile);
            },
          ),
        ],
      ),
    );
  }
}