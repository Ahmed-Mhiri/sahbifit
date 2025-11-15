import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/create_session_cubit.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_type_toggle.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:go_router/go_router.dart'; // ADD THIS IMPORT


class CreateSessionPage extends StatelessWidget {
  const CreateSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CreateSessionCubit>()),
        BlocProvider(create: (context) => getIt<GymListCubit>()..fetchApprovedGyms()),
      ],
      child: BlocListener<CreateSessionCubit, CreateSessionState>(
        listener: (context, state) {
          if (state.status == CreateSessionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Session created successfully!'),
                backgroundColor: AppTheme.successGreen,
              ),
            );
            // Navigate to the details page of the new session
            context.pushReplacement('/session/${state.createdSession!.sessionId}');
          } else if (state.status == CreateSessionStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'An error occurred.'),
                backgroundColor: AppTheme.primaryRed,
              ),
            );
          }
        },
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Create Session'),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: _CreateSessionForm(),
          ),
        ),
      ),
    );
  }
}

class _CreateSessionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateSessionCubit>();
    final state = cubit.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTextField(
          label: 'Session Title',
          hintText: 'e.g., Morning Chest Day',
          onChanged: cubit.titleChanged,
        ),
        const SizedBox(height: AppTheme.sectionSpacing),
        Text('Session Type', style: context.textTheme.titleMedium),
        const SizedBox(height: AppTheme.elementSpacing),
        SessionTypeToggle(
          selectedType: state.sessionType,
          onTypeChanged: cubit.sessionTypeChanged,
        ),
        const SizedBox(height: AppTheme.sectionSpacing),
        Text('Location', style: context.textTheme.titleMedium),
        const SizedBox(height: AppTheme.elementSpacing),
        _GymSelector(),
        const SizedBox(height: AppTheme.sectionSpacing),
        // Simple Date/Time Pickers (a real app might use better pickers)
        ElevatedButton(
          onPressed: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: state.startTime,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 30)),
            );
            if (date != null && context.mounted) {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(state.startTime),
              );
              if (time != null) {
                final newStartTime = DateTime(
                    date.year, date.month, date.day, time.hour, time.minute);
                cubit.startTimeChanged(newStartTime);
              }
            }
          },
          child: Text(
              'Start: ${formatReadableDateTime(state.startTime.toIso8601String())}'),
        ),
        ElevatedButton(
          onPressed: () async {
             final date = await showDatePicker(
              context: context,
              initialDate: state.endTime,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 30)),
            );
            if (date != null && context.mounted) {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(state.endTime),
              );
              if (time != null) {
                final newEndTime = DateTime(
                    date.year, date.month, date.day, time.hour, time.minute);
                cubit.endTimeChanged(newEndTime);
              }
            }
          },
          child: Text(
              'End: ${formatReadableDateTime(state.endTime.toIso8601String())}'),
        ),

        const SizedBox(height: AppTheme.sectionSpacing),
        Text('Max Participants: ${state.maxParticipants}',
            style: context.textTheme.titleMedium),
        Slider(
          value: state.maxParticipants.toDouble(),
          min: 2,
          max: 10,
          divisions: 8,
          label: state.maxParticipants.toString(),
          onChanged: (value) => cubit.maxParticipantsChanged(value.toInt()),
        ),
        const SizedBox(height: AppTheme.sectionSpacing),
        PrimaryButton(
          text: 'Create Session',
          isLoading: state.status == CreateSessionStatus.loading,
          onPressed: cubit.submitCreateSession,
        ),
      ],
    );
  }
}

class _GymSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createCubit = context.read<CreateSessionCubit>();
    return BlocBuilder<GymListCubit, GymListState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const LoadingIndicator(),
          loading: (_) => const LoadingIndicator(),
          error: (e) => Text('Error loading gyms: ${e.message}'),
          loaded: (s) {
            return DropdownButtonFormField<Gym>(
              decoration: const InputDecoration(
                labelText: 'Select Gym',
              ),
              items: s.gyms
                  .map((gym) => DropdownMenuItem(
                        value: gym,
                        child: Text(gym.name),
                      ))
                  .toList(),
              onChanged: (gym) {
                if (gym != null) {
                  createCubit.gymChanged(gym);
                }
              },
            );
          },
        );
      },
    );
  }
}