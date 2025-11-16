import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// REMOVED: import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/session/presentation/cubit/session_feed_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_card.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/features/verification/domain/enums/verification_status_enum.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

// --- ADDED PROFILE BLOC IMPORTS (ADJUST PATHS IF NEEDED) ---
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
// -----------------------------------------------------------

class SessionFeedPage extends StatefulWidget { // <-- CONVERTED TO STATEFUL
  const SessionFeedPage({super.key});

  @override
  State<SessionFeedPage> createState() => _SessionFeedPageState();
}

class _SessionFeedPageState extends State<SessionFeedPage> { // <-- CREATED STATE
  @override
  void initState() {
    super.initState();
    // --- ADDED: Trigger profile load on init ---
    // Assumes ProfileBloc is provided above this widget (e.g., in your router)
    context.read<ProfileBloc>().add(const ProfileEvent.loadMyProfile());
    // -------------------------------------------
  }

  @override
  Widget build(BuildContext context) {
    // --- MODIFIED: Watch ProfileBloc instead of AppBloc ---
    final profileState = context.watch<ProfileBloc>().state;
    // ----------------------------------------------------

    // --- MODIFIED: Handle ProfileBloc states ---
    return profileState.maybeWhen(
      loading: () =>
          const Scaffold(body: LoadingIndicator(message: 'Loading profile...')),
      error: (message) => Scaffold(
        body: ErrorStateWidget(
          message: message,
          buttonText: 'Try Again',
          onRetry: () =>
              context.read<ProfileBloc>().add(const ProfileEvent.loadMyProfile()),
        ),
      ),
      loaded: (currentUser) {
        // We have the user, now build the session feed
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
                              context.push('/create-session'),
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
                              session.creator.role == UserRole.admin;
                          final bool isLocked =
                              currentUser.verificationStatus ==
                                      VerificationStatus.pendingReview &&
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
              onPressed: () => context.push('/create-session'),
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
      orElse: () =>
          const Scaffold(body: LoadingIndicator(message: 'Initializing...')),
    );
    // ----------------------------------------------------
  }
}