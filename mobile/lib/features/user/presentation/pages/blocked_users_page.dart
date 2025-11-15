import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/presentation/cubit/blocked_users_cubit.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
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
              loaded: (users, _) {
                if (users.isEmpty) {
                  return const Center(
                    child: EmptyStateWidget(
                      icon: Icons.person_off_outlined,
                      title: 'No Blocked Users',
                      message: 'Your block list is empty.',
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: users.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: user.profilePhotoUrl != null
                            ? NetworkImage(user.profilePhotoUrl!)
                            : null,
                        child: user.profilePhotoUrl == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      title: Text(user.firstName),
                      trailing: TextButton(
                        child: const Text('Unblock',
                            style: TextStyle(color: AppTheme.primaryRed)),
                        onPressed: () {
                          context
                              .read<BlockedUsersCubit>()
                              .unblockUser(user.userId);
                        },
                      ),
                    );
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