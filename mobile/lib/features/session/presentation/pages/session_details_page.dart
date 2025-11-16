import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// REMOVED: import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/domain/entities/session_participant.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/session/presentation/cubit/session_details_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/reputation_gate_dialog.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_participant_list.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
// --- ADDED PROFILE BLOC IMPORTS (ADJUST PATHS IF NEEDED) ---
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
// -----------------------------------------------------------

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
  late final SessionDetailsCubit _cubit;
  // REMOVED: late final User _currentUser;
  @override
  void initState() {
    super.initState();
    // REMOVED: ProfileBloc logic from here
    _cubit = getIt<SessionDetailsCubit>()
      ..fetchSessionDetails(widget.sessionId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // --- WRAPPED IN PROFILE BLOC BUILDER ---
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return profileState.when(
          initial: () => const Scaffold(
              body: LoadingIndicator(message: 'Loading profile...')),
          loading: () => const Scaffold(
              body: LoadingIndicator(message: 'Loading profile...')),
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
            // --- PROFILE IS LOADED, NOW BUILD SESSION DETAILS PAGE ---
            return BlocProvider.value(
              value: _cubit,
              child: Scaffold(
                body: BlocConsumer<SessionDetailsCubit, SessionDetailsState>(
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
                    return state.when(
                      initial: () => const LoadingIndicator(),
                      loading: () => const LoadingIndicator(),
                      error: (message) => Center(
                        child: ErrorStateWidget(
                          message: message,
                          buttonText: 'Try Again',
                          onRetry: () =>
                              _cubit.fetchSessionDetails(widget.sessionId),
                        ),
                      ),
                      loaded: (session, participants, isJoined, isJoinLoading,
                          errorMessage) {
                        return _buildLoadedBody(
                          context,
                          session,
                          participants,
                          isJoined,
                          isJoinLoading,
                          errorMessage,
                          currentUser, // <-- Pass current user
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
    // ----------------------------------------
  }

  // UPDATED function signature
  Widget _buildLoadedBody(
    BuildContext context,
    Session session,
    List<SessionParticipant> participants,
    bool isJoined,
    bool isJoinLoading,
    String? errorMessage,
    User currentUser, // <-- Added
  ) {
    final isCreator = session.creator.userId == currentUser.userId;
    // <-- Use passed user

    return CustomScrollView(
      slivers: [
        CustomAppBar(
          title: session.title,
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
            isJoined,
            isJoinLoading,
            isCreator,
            currentUser, // <-- Pass current user
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

  // UPDATED function signature
  Widget _buildBottomButton(
    BuildContext context,
    Session session,
    List<SessionParticipant> participants,
    bool isJoined,
    bool isJoinLoading,
    bool isCreator,
    User currentUser, // <-- Added
  ) {
    final bool isFull = participants.length >= session.maxParticipants;
    // Feature 3: Reputation Gate Logic
    final bool hasAttendedGroupSession =
        currentUser.groupSessionCount > 0;
    // <-- Use passed user
    final bool isOneOnOne = session.sessionType == SessionType.oneOnOne;
    final bool isGated = isOneOnOne && !hasAttendedGroupSession;

    // Feature 3: Ephemeral Chat Logic
    final bool canChat = DateTime.now()
            .isAfter(session.startTime.subtract(const Duration(hours: 1))) &&
        DateTime.now().isBefore(session.endTime.add(const Duration(hours: 1)));
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
            PrimaryButton(
              text: 'Mark Attendance',
              onPressed: () =>
                  // MODIFIED: Navigation no longer passes the 'extra' argument
                  context.push('/session/${session.sessionId}/attendance'),
            )
          else if (isJoined)
            PrimaryButton(
              text: canChat ? 'Open Chat' : 'Chat (Locked)',
              onPressed: canChat
                  ? () => context.push('/session/${session.sessionId}/chat')
                  : null,
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
                  : () => _cubit.joinSession(session.sessionId),
            ),
        ],
      ),
    );
  }
}