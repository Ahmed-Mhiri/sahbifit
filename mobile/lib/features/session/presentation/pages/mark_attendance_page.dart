// lib/features/session/presentation/pages/mark_attendance_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
// --- REMOVED ---
// import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/presentation/cubit/mark_attendance_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_participant_list.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:sahbifit/core/di/service_locator.dart';

// Assuming your context.textTheme extension is imported via another file or AppTheme
// If not, you might need to use Theme.of(context).textTheme...

/// This widget is responsible for providing the [MarkAttendanceCubit]
/// to the [MarkAttendanceView].
class MarkAttendancePage extends StatelessWidget {
  final String sessionId; // <-- CHANGED

  const MarkAttendancePage({
    super.key,
    required this.sessionId, // <-- CHANGED
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MarkAttendanceCubit>()
        ..loadSession(sessionId), // <-- PASS THE SESSION ID
      child: MarkAttendanceView(
        // We pass the session ID to the view for the 'Try Again' button
        sessionId: sessionId,
      ),
    );
  }
}

/// This widget displays the UI for marking attendance, consuming the
/// [MarkAttendanceCubit] provided by [MarkAttendancePage].
class MarkAttendanceView extends StatelessWidget {
  final String sessionId; // <-- CHANGED

  const MarkAttendanceView({
    super.key,
    required this.sessionId, // <-- CHANGED
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Mark Attendance'),
      body: BlocConsumer<MarkAttendanceCubit, MarkAttendanceState>(
        listener: (context, state) {
          state.maybeMap(
            loaded: (s) {
              if (s.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(s.errorMessage!),
                    backgroundColor: AppTheme.primaryRed,
                  ),
                );
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.map(
            initial: (_) => const LoadingIndicator(),
            loading: (_) => const LoadingIndicator(),
            error: (e) => ErrorStateWidget(
              message: e.message,
              buttonText: 'Try Again',
              // Use context.read to access the cubit and pass the sessionId
              onRetry: () =>
                  context.read<MarkAttendanceCubit>().loadSession(sessionId),
            ),
            loaded: (s) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.session.title,
                      // Assuming context.textTheme.headlineMedium is a valid theme extension
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: AppTheme.elementSpacing),
                    Text(
                      'Mark participants as "Attended" or "No Show". This affects their reliability rating.',
                      // Assuming context.textTheme.bodyMedium is a valid theme extension
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Divider(height: AppTheme.sectionSpacing),
                    if (s.isSubmitting) const LinearProgressIndicator(),
                    SessionParticipantList(
                      participants: s.participants,
                      onMarkAttendance: (userId, status) {
                        // Use context.read to access the cubit
                        context
                            .read<MarkAttendanceCubit>()
                            .submitAttendance(userId, status);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}