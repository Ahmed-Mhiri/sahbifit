import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/entities/user.dart'; // Ensure correct import
import 'package:sahbifit/features/user/presentation/cubit/blocked_users_cubit.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart'; // Import ConfirmationDialog
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class BlockedUsersPage extends StatelessWidget {
  const BlockedUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BlockedUsersCubit>()..loadBlockedUsers(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Blocked Users'),
        body: BlocConsumer<BlockedUsersCubit, BlockedUsersState>(
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
              error: (message) => ErrorStateWidget(
                message: message,
                buttonText: 'Retry',
                onRetry: () =>
                    context.read<BlockedUsersCubit>().loadBlockedUsers(),
              ),
              loaded: (users, errorMessage) { // Fix destructuring
                if (users.isEmpty) {
                  return const Center(
                    child: EmptyStateWidget(
                      icon: Icons.person_off_outlined,
                      title: 'No Blocked Users',
                      message: 'You haven\'t blocked anyone yet.',
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(AppTheme.defaultPadding),
                  itemCount: users.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return _BlockedUserTile(user: user);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _BlockedUserTile extends StatelessWidget {
  final User user;

  const _BlockedUserTile({required this.user});

  void _confirmUnblock(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        title: 'Unblock ${user.firstName}?',
        message: 'They will be able to see your profile and sessions again. Are you sure?',
        confirmText: 'Unblock',
        cancelText: 'Cancel',
        onConfirm: () {
          // Call the Cubit from the parent context
          context.read<BlockedUsersCubit>().unblockUser(user.userId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: user.profilePhotoUrl != null
            ? NetworkImage(user.profilePhotoUrl!)
            : null,
        backgroundColor: AppTheme.lightGray,
        child: user.profilePhotoUrl == null
            ? const Icon(Icons.person, color: AppTheme.disabledGray)
            : null,
      ),
      title: Text(
        user.firstName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: TextButton(
        onPressed: () => _confirmUnblock(context),
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.darkGray, // Neutral color for unblock
        ),
        child: const Text('Unblock'),
      ),
    );
  }
}