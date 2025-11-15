import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/session/presentation/cubit/session_feed_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_card.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart'; // ADDED THIS IMPORT
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class SessionFeedPage extends StatelessWidget {
  const SessionFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Assumes AppBloc is provided above this route
    final appState = context.watch<AppBloc>().state;
    final currentUser = appState.mapOrNull(authenticated: (s) => s.user);

    if (currentUser == null) {
      // This shouldn't happen if routing is correct, but good to guard
      return const Scaffold(body: LoadingIndicator(message: 'Authenticating...'));
    }

    return BlocProvider(
      create: (context) => getIt<SessionFeedCubit>()..fetchSessions(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Sessions',
          showBackButton: false,
          // You could add filter actions here
        ),
        body: BlocBuilder<SessionFeedCubit, SessionFeedState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const LoadingIndicator(),
              loading: (_) => const LoadingIndicator(),
              error: (e) => ErrorStateWidget(
                message: e.message,
                buttonText: 'Try Again',
                onRetry: () =>
                    context.read<SessionFeedCubit>().fetchSessions(),
              ),
              loaded: (s) {
                if (s.sessions.isEmpty) {
                  return Center(
                    child: EmptyStateWidget(
                      icon: Icons.search_off_rounded,
                      title: 'No Sessions Yet',
                      message:
                          'Looks quiet... Why not be the first to host one?',
                      buttonText: 'Create a Session',
                      onButtonPressed: () =>
                          context.push('/create-session'), // UPDATED
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      context.read<SessionFeedCubit>().fetchSessions(),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
                    itemCount: s.sessions.length,
                    itemBuilder: (context, index) {
                      final session = s.sessions[index];

                      // Feature 2: Probationary Mode Logic
                      final bool isAmbassadorSession =
                          session.creator.role == UserRole.admin; // Placeholder logic
                      final bool isLocked =
                          currentUser.verificationStatus == VerificationStatus.pendingReview && // CHANGED THIS LINE
                              !isAmbassadorSession;

                      return SessionCardWrapper(
                        session: session,
                        isLocked: isLocked,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/create-session'), // UPDATED
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}