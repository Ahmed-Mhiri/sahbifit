import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/session/presentation/cubit/mark_attendance_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_participant_list.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class MarkAttendancePage extends StatefulWidget {
  final String sessionId;

  const MarkAttendancePage({
    super.key,
    required this.sessionId,
  });

  @override
  State<MarkAttendancePage> createState() => _MarkAttendancePageState();
}

class _MarkAttendancePageState extends State<MarkAttendancePage> {
  late final MarkAttendanceCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<MarkAttendanceCubit>()..loadSession(widget.sessionId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Mark Attendance'),
        body: BlocConsumer<MarkAttendanceCubit, MarkAttendanceState>(
          listener: (context, state) {
            state.maybeMap(
              loaded: (s) {
                if (s.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(s.errorMessage!),
                        backgroundColor: AppTheme.primaryRed),
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
                onRetry: () => _cubit.loadSession(widget.sessionId),
              ),
              loaded: (s) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppTheme.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.session.title,
                          style: context.textTheme.headlineMedium),
                      const SizedBox(height: AppTheme.elementSpacing),
                      Text(
                        'Mark participants as "Attended" or "No Show". This affects their reliability rating.',
                        style: context.textTheme.bodyMedium,
                      ),
                      const Divider(height: AppTheme.sectionSpacing),
                      if (s.isSubmitting) const LinearProgressIndicator(),
                      SessionParticipantList(
                        participants: s.participants,
                        onMarkAttendance: (userId, status) {
                          _cubit.submitAttendance(userId, status);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}