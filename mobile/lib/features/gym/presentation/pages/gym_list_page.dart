import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';


class GymListPage extends StatelessWidget {
  const GymListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GymListCubit>()..fetchApprovedGyms(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Approved Gyms'),
        body: BlocBuilder<GymListCubit, GymListState>(
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const LoadingIndicator(message: 'Loading gyms...'),
              loading: () =>
                  const LoadingIndicator(message: 'Loading gyms...'),
              error: (message) => ErrorStateWidget(
                message: message,
                buttonText: 'Retry',
                onRetry: () {
                  context.read<GymListCubit>().fetchApprovedGyms();
                },
              ),
              loaded: (gyms) {
                if (gyms.isEmpty) {
                  return const Center(
                    child: EmptyStateWidget(
                      icon: Icons.search_off_rounded,
                      title: 'No Gyms Found',
                      message:
                          'There are no approved gyms in the system yet. You can submit one!',
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(AppTheme.defaultPadding),
                  itemCount: gyms.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final gym = gyms[index];
                    return ListTile(
                      title: Text(gym.name,
                          style: context.textTheme.titleMedium),
                      subtitle: Text(
                        gym.address ?? 'No address provided',
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: AppTheme.disabledGray),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            gym.memberCount.toString(),
                            style: context.textTheme.titleMedium
                                ?.copyWith(color: AppTheme.primaryRed),
                          ),
                          Text(
                            'members',
                            style: context.textTheme.bodySmall
                                ?.copyWith(color: AppTheme.disabledGray),
                          ),
                        ],
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
