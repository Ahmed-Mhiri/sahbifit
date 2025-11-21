import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/rating/presentation/bloc/pending_rating_bloc.dart';
import 'package:sahbifit/features/rating/presentation/widgets/create_rating_dialog.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_state.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class ManageActivityPage extends StatelessWidget {
  const ManageActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // To get pending ratings
        BlocProvider(create: (context) => getIt<PendingRatingBloc>()..add(const PendingRatingEvent.fetchList())),
        // To get sessions I created (for attendance)
        BlocProvider(create: (context) => getIt<MySessionsCubit>()..loadMySessions()),
        // To get my ID
        BlocProvider(create: (context) => getIt<ProfileBloc>()..add(const ProfileEvent.loadMyProfile())),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Activity Manager'),
            centerTitle: false,
            bottom: const TabBar(
              labelColor: AppTheme.primaryRed,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppTheme.primaryRed,
              tabs: [
                Tab(text: 'Mark Attendance'),
                Tab(text: 'Rate Users'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              _AttendanceList(),
              _PendingRatingsList(),
            ],
          ),
        ),
      ),
    );
  }
}

// --- TAB 1: ATTENDANCE ---
class _AttendanceList extends StatelessWidget {
  const _AttendanceList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return profileState.maybeWhen(
          loaded: (myself) {
            return BlocBuilder<MySessionsCubit, MySessionsState>(
              builder: (context, sessionState) {
                if (sessionState is MySessionsLoaded) {
                  // Filter: 
                  // 1. I am the creator
                  // 2. Session has started (startTime < now)
                  final now = DateTime.now();
                  final sessionsToManage = [
                    ...sessionState.upcomingSessions, 
                    ...sessionState.pastSessions
                  ].where((s) => s.creator.userId == myself.userId && s.startTime.isBefore(now)).toList();

                  if (sessionsToManage.isEmpty) {
                    return const EmptyStateWidget(
                      icon: Icons.playlist_add_check,
                      title: 'Nothing to Mark',
                      message: 'Sessions you host will appear here after they start.',
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: sessionsToManage.length,
                    separatorBuilder: (ctx, i) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final session = sessionsToManage[index];
                      return _AttendanceCard(session: session);
                    },
                  );
                }
                return const LoadingIndicator();
              },
            );
          },
          orElse: () => const LoadingIndicator(),
        );
      },
    );
  }
}

class _AttendanceCard extends StatelessWidget {
  final Session session;
  const _AttendanceCard({required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(session.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${session.participantCount} Participants • ${session.gym.name}'),
        trailing: ElevatedButton(
          style: AppTheme.primaryButtonStyle.copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          ),
          onPressed: () {
            context.push('/session/${session.sessionId}/attendance');
          },
          child: const Text("Mark"),
        ),
      ),
    );
  }
}

// --- TAB 2: RATINGS ---
class _PendingRatingsList extends StatelessWidget {
  const _PendingRatingsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingRatingBloc, PendingRatingState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingIndicator(),
          loaded: (ratings) {
            if (ratings.isEmpty) {
              return const EmptyStateWidget(
                icon: Icons.star_outline,
                title: 'All Caught Up',
                message: 'You have no pending ratings.',
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: ratings.length,
              separatorBuilder: (ctx, i) => const Divider(),
              itemBuilder: (context, index) {
                final rating = ratings[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text("Rate ${rating.userNameToRate}"),
                  subtitle: Text("Session: ${rating.sessionTitle}"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (dialogContext) {
                        return BlocProvider.value(
                          value: context.read<PendingRatingBloc>(),
                          child: CreateRatingDialog(
                            pendingRating: rating,
                            onSubmit: (val, comment) {
                              context.read<PendingRatingBloc>().add(
                                PendingRatingEvent.submitRating(
                                  sessionId: rating.sessionId,
                                  ratedUserId: rating.userIdToRate,
                                  ratingValue: val,
                                  comment: comment,
                                )
                              );
                              Navigator.pop(dialogContext);
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
          orElse: () => const LoadingIndicator(),
        );
      },
    );
  }
}