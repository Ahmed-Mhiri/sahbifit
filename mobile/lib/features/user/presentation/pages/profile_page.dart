import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/features/user/presentation/widgets/block_user_button.dart';
import 'package:sahbifit/features/user/presentation/widgets/profile_header.dart';
import 'package:sahbifit/features/user/presentation/widgets/user_badge_list.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:sahbifit/features/user/presentation/cubit/user_profile_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_state.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;

  const ProfilePage({this.userId, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool get _isMyProfile => widget.userId == null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _isMyProfile ? 'My Profile' : 'User Profile',
        // FIX: Hide back button if it's my profile (root of tab)
        showBackButton: !_isMyProfile,
        actions: _isMyProfile
            ? [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => context.push('/settings'),
                ),
              ]
            : null,
      ),
      body: _isMyProfile
          ? _MyProfileView()
          : _UserProfileView(userId: widget.userId!),
    );
  }
}

class _MyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.loadMyProfile()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (user) => _ProfileContent(user: user, isMyProfile: true),
            loading: () => const LoadingIndicator(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _UserProfileView extends StatelessWidget {
  final String userId;
  const _UserProfileView({required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<UserProfileCubit>()..loadUserProfile(userId)),
        // Load my sessions to check for overlaps for messaging
        BlocProvider(
            create: (context) => getIt<MySessionsCubit>()..loadMySessions()),
      ],
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (user) => _ProfileContent(user: user, isMyProfile: false),
            loading: () => const LoadingIndicator(),
            // Update the Error Handler for "Invisibility Cloak"
            error: (msg) {
              // If backend returns 404 due to block, it usually comes as "User not found..."
              // We show a standard "not found" UI to mimic them not existing.
              if (msg.toLowerCase().contains('not found')) {
                return const Scaffold(
                  body: EmptyStateWidget(
                    icon: Icons.person_off_rounded,
                    title: 'User Not Found',
                    message: 'This profile is not available.',
                  ),
                );
              }
              return Scaffold(
                body: ErrorStateWidget(
                  message: msg,
                  buttonText: 'Retry',
                  onRetry: () =>
                      context.read<UserProfileCubit>().loadUserProfile(userId),
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final User user;
  final bool isMyProfile;

  const _ProfileContent({required this.user, required this.isMyProfile});

  // Logic to find if we can message this user
  void _onMessagePressed(BuildContext context) {
    final mySessionsState = context.read<MySessionsCubit>().state;

    if (mySessionsState is MySessionsLoaded) {
      final allSessions = [
        ...mySessionsState.upcomingSessions,
        ...mySessionsState.pastSessions
      ];

      // Find sessions where THIS user is the creator or a participant (simplified logic)
      final now = DateTime.now();

      final validSessions = allSessions.where((s) {
        final startWindow = s.startTime.subtract(const Duration(hours: 1));
        final endWindow = s.endTime.add(const Duration(hours: 1));
        // Check time window AND if they are involved (simplification: checking creator ID)
        return now.isAfter(startWindow) &&
            now.isBefore(endWindow) &&
            s.creator.userId == user.userId;
      }).toList();

      if (validSessions.isNotEmpty) {
        // Go to the first valid session chat
        context.push('/session/${validSessions.first.sessionId}/chat');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  "You can only message 1 hour before/after a shared session.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      children: [
        ProfileHeader(user: user),
        UserBadgeList(badges: user.userBadges),
        const SizedBox(height: AppTheme.sectionSpacing),

        // Only show interaction buttons if this is NOT my profile
        if (!isMyProfile) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => _onMessagePressed(context),
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text("Message User"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.trustBlue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          BlockUserButton(userId: user.userId, userName: user.firstName),
        ]
      ],
    );
  }
}