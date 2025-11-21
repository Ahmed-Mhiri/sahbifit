// FILE: lib/features/session/presentation/pages/session_details_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/participant_status.dart'; // Needed for status check
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/session/presentation/cubit/session_details_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/reputation_gate_dialog.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_participant_list.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';

class SessionDetailsPage extends StatefulWidget {
  final String sessionId;
  const SessionDetailsPage({
    super.key,
    required this.sessionId,
  });

  @override
  State<SessionDetailsPage> createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends State<SessionDetailsPage> {

  // --- ADDED: Confirmation Logic ---
  void _onLeavePressed(BuildContext context, Session session) {
    final now = DateTime.now();
    // 1 hour cutoff
    final penaltyCutoff = session.startTime.subtract(const Duration(hours: 1));
    final isLateCancellation = now.isAfter(penaltyCutoff);

    if (isLateCancellation) {
      // Show WARNING Dialog
      showDialog(
        context: context,
        builder: (_) => ConfirmationDialog(
          title: 'Late Cancellation Warning',
          message: 'The session starts in less than 1 hour.\n\n'
              'Cancelling now will count as a "Late Cancel". '
              'Frequent late cancellations (6+) result in an "Unreliable" badge and temporary suspension.\n\n'
              'Are you sure?',
          confirmText: 'Yes, Cancel Anyway',
          cancelText: 'Go Back',
          onConfirm: () {
             context.read<SessionDetailsCubit>().leaveSession(session.sessionId);
          },
        ),
      );
    } else {
      // Show SAFE Dialog
      showDialog(
        context: context,
        builder: (_) => ConfirmationDialog(
          title: 'Leave Session?',
          message: 'Are you sure you want to leave this session? '
              'This spot will open up for others.',
          confirmText: 'Leave',
          cancelText: 'Stay',
          onConfirm: () {
             context.read<SessionDetailsCubit>().leaveSession(session.sessionId);
          },
        ),
      );
    }
  }
  // ---------------------------------

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return profileState.when(
          initial: () => const Scaffold(body: LoadingIndicator(message: 'Loading profile...')),
          loading: () => const Scaffold(body: LoadingIndicator(message: 'Loading profile...')),
          error: (message) => Scaffold(
            body: ErrorStateWidget(
              message: message,
              buttonText: 'Retry',
              onRetry: () => context
                  .read<ProfileBloc>()
                  .add(const ProfileEvent.loadMyProfile()),
            ),
          ),

          loaded: (currentUser) {
            return BlocProvider(
              create: (context) => getIt<SessionDetailsCubit>()
                ..fetchSessionDetails(widget.sessionId, currentUser.userId),
              child: Scaffold(
                body: Builder(
                    builder: (context) {
                      return BlocConsumer<SessionDetailsCubit, SessionDetailsState>(
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
                          return state.when(
                            initial: () => const LoadingIndicator(),
                            loading: () => const LoadingIndicator(),
                            error: (message) => Center(
                              child: ErrorStateWidget(
                                message: message,
                                buttonText: 'Try Again',
                                onRetry: () => context.read<SessionDetailsCubit>()
                                    .fetchSessionDetails(widget.sessionId, currentUser.userId),
                              ),
                            ),
                            loaded: (session, participants, isJoined, isJoinLoading, isLeaveLoading, errorMessage) {
                              return _buildLoadedBody(
                                context,
                                session,
                                participants,
                                isJoined,
                                isJoinLoading,
                                isLeaveLoading, // Pass new state
                                errorMessage,
                                currentUser,
                              );
                            },
                          );
                        },
                      );
                    }
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLoadedBody(
      BuildContext context,
      Session session,
      List<SessionParticipant> participants,
      bool isJoined,
      bool isJoinLoading,
      bool isLeaveLoading, // <--- Arg
      String? errorMessage,
      User currentUser,
      ) {
    final isCreator = session.creator.userId == currentUser.userId;
    
    // Find my participant record if joined
    SessionParticipant? myParticipant;
    if (isJoined) {
      try {
        myParticipant = participants.firstWhere((p) => p.userId == currentUser.userId);
      } catch (_) {}
    }

    // If status is 'left' or 'no_show', treat as NOT effectively joined for the button logic
    // (User sees 'Join' again or 'Left' status)
    final bool isEffectivelyJoined = isJoined && 
        (myParticipant?.status == ParticipantStatus.joined || myParticipant?.status == ParticipantStatus.attended);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            session.title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          backgroundColor: AppTheme.cleanWhite,
          foregroundColor: AppTheme.darkGray,
          elevation: 0,
          pinned: true,
          floating: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => context.pop(),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoTile(
                  context,
                  icon: Icons.calendar_today_rounded,
                  title: 'Date & Time',
                  subtitle:
                  '${formatReadableDateTime(session.startTime.toIso8601String())}\n${formatReadableTime(session.endTime.toIso8601String())} (End)',
                ),
                _buildInfoTile(
                  context,
                  icon: Icons.location_on_rounded,
                  title: 'Location',
                  subtitle: session.gym.name,
                ),
                _buildInfoTile(
                  context,
                  icon: Icons.people_rounded,
                  title: 'Participants',
                  subtitle:
                  '${participants.length} / ${session.maxParticipants} joined',
                ),
                const SizedBox(height: AppTheme.elementSpacing),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    // Placeholder
                  ),
                  title: Text('Hosted by ${session.creator.firstName}',
                      style: context.textTheme.titleMedium),
                  subtitle: const Text('View Profile'),
                  onTap: () =>
                      context.push('/user/${session.creator.userId}'),
                ),
                const Divider(),
                const SizedBox(height: AppTheme.elementSpacing),
                Text('Who\'s Going', style: context.textTheme.headlineSmall),
                const SizedBox(height: AppTheme.elementSpacing),
                SessionParticipantList(participants: participants),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: _buildBottomButton(
            context,
            session,
            participants,
            isEffectivelyJoined, // Use the corrected bool
            isJoinLoading,
            isLeaveLoading,
            isCreator,
            currentUser,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryRed, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(subtitle, style: context.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(
      BuildContext context,
      Session session,
      List<SessionParticipant> participants,
      bool isJoined, // This is now isEffectivelyJoined
      bool isJoinLoading,
      bool isLeaveLoading,
      bool isCreator,
      User currentUser,
      ) {
    final bool isFull = participants.length >= session.maxParticipants;
    final bool hasAttendedGroupSession = currentUser.groupSessionCount > 0;
    final bool isOneOnOne = session.sessionType == SessionType.oneOnOne;
    final bool isGated = isOneOnOne && !hasAttendedGroupSession;

    final bool canChat = DateTime.now()
        .isAfter(session.startTime.subtract(const Duration(hours: 1))) &&
        DateTime.now().isBefore(session.endTime.add(const Duration(hours: 1)));

    final bool canMarkAttendance = DateTime.now().isAfter(session.startTime);

    final cubit = context.read<SessionDetailsCubit>();

    return Container(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      decoration: BoxDecoration(
        color: AppTheme.cleanWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCreator)
            if (canMarkAttendance)
              PrimaryButton(
                text: 'Mark Attendance',
                onPressed: () =>
                    context.push('/session/${session.sessionId}/attendance'),
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Attendance opens after session starts",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.darkGray,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
          else if (isJoined)
            // --- UPDATED: Show Chat Button + Leave Button ---
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    text: canChat ? 'Open Chat' : 'Chat (Locked)',
                    // Chat is only primary action
                    onPressed: canChat
                        ? () => context.push('/session/${session.sessionId}/chat')
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: SecondaryButton(
                    text: 'Leave',
                    isLoading: isLeaveLoading,
                    onPressed: () => _onLeavePressed(context, session),
                  ),
                ),
              ],
            )
          else if (isFull)
              const PrimaryButton(
                text: 'Session Full',
                onPressed: null,
              )
            else
              PrimaryButton(
                text: isGated
                    ? 'Join (Requires 1 Group Session)'
                    : 'Join Session',
                isLoading: isJoinLoading,
                onPressed: isGated
                    ? () => showReputationGateDialog(context)
                    : () => cubit.joinSession(session.sessionId),
              ),
        ],
      ),
    );
  }
}