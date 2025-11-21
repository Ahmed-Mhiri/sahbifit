import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/session/presentation/cubit/mark_attendance_cubit.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class MarkAttendancePage extends StatelessWidget {
  final String sessionId;

  const MarkAttendancePage({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MarkAttendanceCubit>()..loadSession(sessionId),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Mark Attendance'),
        body: const _AttendanceBody(),
      ),
    );
  }
}

class _AttendanceBody extends StatelessWidget {
  const _AttendanceBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarkAttendanceCubit, MarkAttendanceState>(
      listener: (context, state) {
        state.maybeMap(
          loaded: (s) {
            if (s.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(s.errorMessage!), backgroundColor: AppTheme.primaryRed),
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
            buttonText: 'Retry',
            onRetry: () => context.read<MarkAttendanceCubit>().loadSession(context.read<MarkAttendanceCubit>().state.maybeMap(loaded: (s) => s.session.sessionId, orElse: () => '')),
          ),
          loaded: (s) {
            if (s.participants.isEmpty) {
              return const Center(child: Text("No participants joined yet."));
            }

            return Column(
              children: [
                if (s.isSubmitting) const LinearProgressIndicator(),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: s.participants.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final p = s.participants[index];
                      // Don't show the host in the attendance list
                      if (p.userId == s.session.creator.userId) return const SizedBox.shrink();

                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: p.user.profilePhotoUrl != null 
                                  ? NetworkImage(p.user.profilePhotoUrl!) 
                                  : null,
                                child: p.user.profilePhotoUrl == null 
                                  ? Text(p.user.firstName[0]) 
                                  : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(p.user.firstName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text(
                                      p.status == ParticipantStatus.joined ? "Not marked yet" : p.status.name.toUpperCase(),
                                      style: TextStyle(
                                        color: p.status == ParticipantStatus.attended ? AppTheme.successGreen : Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Action Buttons
                              Row(
                                children: [
                                  _AttendanceButton(
                                    icon: Icons.check,
                                    color: AppTheme.successGreen,
                                    isSelected: p.status == ParticipantStatus.attended,
                                    onTap: () => context.read<MarkAttendanceCubit>().submitAttendance(p.userId, ParticipantStatus.attended),
                                  ),
                                  const SizedBox(width: 8),
                                  _AttendanceButton(
                                    icon: Icons.close,
                                    color: AppTheme.primaryRed,
                                    isSelected: p.status == ParticipantStatus.noShow,
                                    onTap: () => context.read<MarkAttendanceCubit>().submitAttendance(p.userId, ParticipantStatus.noShow),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _AttendanceButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _AttendanceButton({
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          border: Border.all(color: isSelected ? color : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}