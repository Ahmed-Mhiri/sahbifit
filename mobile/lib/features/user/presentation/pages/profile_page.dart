import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
// import 'package:sahbifit/features/user/domain/usecases/get_user_profile.dart'; // REMOVED
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/features/user/presentation/widgets/block_user_button.dart';
import 'package:sahbifit/features/user/presentation/widgets/profile_header.dart';
import 'package:sahbifit/features/user/presentation/widgets/user_badge_list.dart';
import 'package:sahbifit/features/user/presentation/widgets/visibility_settings_widget.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

// --- ADD THESE NEW IMPORTS ---
import 'package:sahbifit/features/user/presentation/cubit/user_profile_cubit.dart';
// Note: The state is included via the cubit, but adding it is fine too.
// import 'package:sahbifit/features/user/presentation/cubit/user_profile_state.dart';
// --- END OF NEW IMPORTS ---

class ProfilePage extends StatefulWidget {
  final String? userId;

  const ProfilePage({
    this.userId,
    super.key,
  });

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
        actions: _isMyProfile
            ? [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Navigate to settings using GoRouter
                    context.push('/settings');
                  },
                ),
              ]
            : null,
      ),
      body: _isMyProfile
          // If it's my profile, use the dedicated ProfileBloc
          ? _MyProfileView()
          // If it's another user's profile, use the new UserProfileCubit
          : _UserProfileView(userId: widget.userId!),
    );
  }
}

// View for showing the current authenticated user's profile
class _MyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.loadMyProfile()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppTheme.primaryRed,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingIndicator(),
            loading: () => const LoadingIndicator(),
            loaded: (user) => _ProfileContent(user: user, isMyProfile: true),
            error: (message) => ErrorStateWidget(
              message: message,
              buttonText: 'Retry',
              onRetry: () {
                context
                    .read<ProfileBloc>()
                    .add(const ProfileEvent.loadMyProfile());
              },
            ),
          );
        },
      ),
    );
  }
}

// --- THIS IS THE MODIFIED WIDGET ---
// View for showing another user's profile
class _UserProfileView extends StatelessWidget {
  final String userId;
  const _UserProfileView({required this.userId});

  @override
  Widget build(BuildContext context) {
    // 1. Provide the new cubit and load the profile
    return BlocProvider(
      create: (context) => getIt<UserProfileCubit>()..loadUserProfile(userId),
      // 2. Use BlocBuilder to listen to state changes
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          // 3. Map states to UI (just like _MyProfileView)
          return state.when(
            initial: () => const LoadingIndicator(),
            loading: () => const LoadingIndicator(),
            loaded: (user) => _ProfileContent(user: user, isMyProfile: false),
            error: (message) => ErrorStateWidget(
              message: message,
              buttonText: 'Retry', // Made consistent with _MyProfileView
              onRetry: () =>
                  context.read<UserProfileCubit>().loadUserProfile(userId),
            ),
          );
        },
      ),
    );
  }
}
// --- END OF MODIFICATION ---

// Shared content widget for both profile views
class _ProfileContent extends StatelessWidget {
  final User user;
  final bool isMyProfile;

  const _ProfileContent({
    required this.user,
    required this.isMyProfile,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (isMyProfile) {
          context
              .read<ProfileBloc>()
              .add(const ProfileEvent.loadMyProfile());
        }
        // --- UPDATE: This limitation is now fixed by using a Bloc! ---
        // We can add a refresh to the UserProfileCubit here if needed.
        else {
          context.read<UserProfileCubit>().loadUserProfile(user.userId);
        }
      },
      child: ListView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        children: [
          // 1. Header
          ProfileHeader(user: user),

          // 2. Badges
          UserBadgeList(badges: user.userBadges),
          const SizedBox(height: AppTheme.sectionSpacing),

          // 3. Settings (My Profile) or Block (Other Profile)
          if (isMyProfile)
            VisibilitySettingsWidget(
              currentVisibility: user.profileVisibility,
              verifiedGender: user.verifiedGender,
              onChanged: (newVisibility) {
                // Dispatch event to update visibility
                context.read<ProfileBloc>().add(
                      ProfileEvent.visibilityChanged(
                          newVisibility: newVisibility),
                    );
              },
            )
          else
            BlockUserButton(
              userId: user.userId,
              userName: user.firstName,
            ),
        ],
      ),
    );
  }
}