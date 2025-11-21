import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_state.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_card.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class MySessionsPage extends StatelessWidget {
  const MySessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MySessionsCubit>()..loadMySessions(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Sessions'),
            bottom: TabBar(
              indicatorColor: AppTheme.primaryRed,
              labelColor: AppTheme.primaryRed,
              unselectedLabelColor: AppTheme.disabledGray,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'History'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              _SessionList(isHistory: false),
              _SessionList(isHistory: true),
            ],
          ),
        ),
      ),
    );
  }
}

class _SessionList extends StatelessWidget {
  final bool isHistory;

  const _SessionList({required this.isHistory});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySessionsCubit, MySessionsState>(
      builder: (context, state) {
        if (state is MySessionsLoading) {
          return const LoadingIndicator(message: "Loading sessions...");
        } else if (state is MySessionsError) {
          return ErrorStateWidget(
            message: state.message,
            buttonText: "Retry",
            onRetry: () => context.read<MySessionsCubit>().loadMySessions(),
          );
        } else if (state is MySessionsLoaded) {
          
          final sessions = isHistory ? state.pastSessions : state.upcomingSessions;

          if (sessions.isEmpty) {
            return EmptyStateWidget(
              title: isHistory ? 'No History' : 'No Plans Yet',
              message: isHistory 
                  ? 'You haven\'t attended any sessions yet.' 
                  : 'Join a session or create one to see it here.',
              icon: isHistory ? Icons.history_toggle_off : Icons.calendar_today_outlined,
              buttonText: isHistory ? null : "Find Sessions",
              onButtonPressed: isHistory ? null : () => context.go('/home'),
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<MySessionsCubit>().loadMySessions(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                return SessionCardWrapper(
                  session: session,
                  isLocked: false, // My sessions are always unlocked
                  isPast: isHistory,
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}