import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/features/user/presentation/widgets/visibility_settings_widget.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.loadMyProfile()),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Settings'),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const LoadingIndicator(),
              loading: () => const LoadingIndicator(),
              loaded: (user) => _buildSettingsList(context, user),
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
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context, User user) {
    return ListView(
      children: [
        // --- Visibility Settings ---
        VisibilitySettingsWidget(
          currentVisibility: user.profileVisibility,
          verifiedGender: user.verifiedGender,
          onChanged: (newVisibility) {
            context
                .read<ProfileBloc>()
                .add(ProfileEvent.visibilityChanged(newVisibility: newVisibility));
          },
        ),
        const Divider(),

        // --- App Features ---
        ListTile(
          leading: const Icon(Icons.rate_review_outlined),
          title: const Text('Pending Ratings'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: () {
            context.push('/pending-ratings');
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_business_outlined),
          title: const Text('Submit a New Gym'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: () {
            context.push('/submit-gym');
          },
        ),
        
        // --- UPDATED THIS TILE ---
        ListTile(
          leading: const Icon(Icons.block),
          title: const Text('Blocked Users'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: () {
            context.push('/blocked-users');
          },
        ),

        const Divider(),

        // --- Account Actions ---
        ListTile(
          leading: Icon(Icons.logout, color: AppTheme.primaryRed),
          title: const Text('Log Out'),
          textColor: AppTheme.primaryRed,
          onTap: () => _showLogoutDialog(context),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: 'Log Out',
        message: 'Are you sure you want to log out?',
        confirmText: 'Log Out',
        cancelText: 'Cancel',
        onConfirm: () {
          // Use getIt to find the global AppBloc and dispatch the event
          getIt<AppBloc>().add(const AppEvent.logoutRequested());
        },
      ),
    );
  }
}