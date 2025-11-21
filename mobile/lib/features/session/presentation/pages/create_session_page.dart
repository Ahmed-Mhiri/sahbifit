import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/create_session_cubit.dart';
import 'package:sahbifit/features/session/domain/enums/session_type.dart';
import 'package:sahbifit/features/session/presentation/widgets/session_type_toggle.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/buttons/custom_buttons.dart';
import 'package:sahbifit/shared/widgets/inputs/custom_inputs.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

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
          appBar: const CustomAppBar(title: 'Plan a Workout'),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: _CreateSessionForm(),
          ),
        ),
      ),
    );
  }
}

class _CreateSessionForm extends StatefulWidget {
  @override
  State<_CreateSessionForm> createState() => _CreateSessionFormState();
}

class _CreateSessionFormState extends State<_CreateSessionForm> {
  // Local state for UI friendliness before sending to Cubit
  DateTime _selectedDay = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);

  Future<void> _pickDay(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() => _selectedDay = picked);
      _updateCubit();
    }
  }

  Future<void> _pickTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
          // Auto-adjust end time to be 1 hour later if it becomes invalid
          if (_endTime.hour < _startTime.hour || 
             (_endTime.hour == _startTime.hour && _endTime.minute <= _startTime.minute)) {
             _endTime = picked.replacing(hour: picked.hour + 1);
          }
        } else {
          _endTime = picked;
        }
      });
      _updateCubit();
    }
  }

  void _updateCubit() {
    final start = DateTime(
      _selectedDay.year, _selectedDay.month, _selectedDay.day, 
      _startTime.hour, _startTime.minute
    );
    final end = DateTime(
      _selectedDay.year, _selectedDay.month, _selectedDay.day, 
      _endTime.hour, _endTime.minute
    );
    
    context.read<CreateSessionCubit>().startTimeChanged(start);
    context.read<CreateSessionCubit>().endTimeChanged(end);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateSessionCubit>();
    final state = cubit.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. What & Where
        Text('Session Details', style: context.textTheme.headlineSmall),
        const SizedBox(height: AppTheme.elementSpacing),
        PrimaryTextField(
          label: 'Title',
          hintText: 'e.g., Chest Day, HIIT Cardio',
          onChanged: cubit.titleChanged,
        ),
        const SizedBox(height: AppTheme.defaultPadding),
        
        // Gym Selector with "Not Found" link
        _GymSelector(), 
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => context.push('/submit-gym'),
            child: const Text('Gym not listed? Add it now', style: TextStyle(fontSize: 12)),
          ),
        ),

        const SizedBox(height: AppTheme.sectionSpacing),

        // 2. When
        Text('Schedule', style: context.textTheme.headlineSmall),
        const SizedBox(height: AppTheme.elementSpacing),
        
        // Day Picker
        _buildSelectionTile(
          context,
          icon: Icons.calendar_month,
          label: "Date",
          value: DateFormat('EEEE, MMMM d, y').format(_selectedDay),
          onTap: () => _pickDay(context),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildSelectionTile(
                context,
                icon: Icons.access_time,
                label: "Start",
                value: _startTime.format(context),
                onTap: () => _pickTime(context, true),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSelectionTile(
                context,
                icon: Icons.access_time_filled,
                label: "End",
                value: _endTime.format(context),
                onTap: () => _pickTime(context, false),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.sectionSpacing),

        // 3. Who
        Text('Type & Participants', style: context.textTheme.headlineSmall),
        const SizedBox(height: AppTheme.elementSpacing),
        
        SessionTypeToggle(
          selectedType: state.sessionType,
          onTypeChanged: cubit.sessionTypeChanged,
        ),
        
        const SizedBox(height: AppTheme.defaultPadding),

        if (state.sessionType == SessionType.group) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Group Size', style: context.textTheme.titleMedium),
              Text('${state.maxParticipants} people', 
                style: context.textTheme.titleMedium?.copyWith(color: AppTheme.primaryRed)),
            ],
          ),
          Slider(
            value: state.maxParticipants.toDouble(),
            min: 3, // Requirement: Group session cannot be 2, must be 3+
            max: 10,
            divisions: 7,
            activeColor: AppTheme.primaryRed,
            onChanged: (value) => cubit.maxParticipantsChanged(value.toInt()),
          ),
          Text(
            'Group sessions are for 3 or more people.',
            style: context.textTheme.bodySmall?.copyWith(color: AppTheme.disabledGray),
          ),
        ] else ...[
           Container(
             padding: const EdgeInsets.all(12),
             decoration: BoxDecoration(
               color: AppTheme.lightGray,
               borderRadius: BorderRadius.circular(8),
             ),
             child: Row(
               children: [
                 const Icon(Icons.info_outline, size: 16, color: AppTheme.darkGray),
                 const SizedBox(width: 8),
                 const Text("1-on-1 sessions are strictly for 2 people."),
               ],
             ),
           ),
        ],

        const SizedBox(height: AppTheme.sectionSpacing * 2),

        PrimaryButton(
          text: 'Create Session',
          isLoading: state.status == CreateSessionStatus.loading,
          onPressed: () {
            // Ensure cubit has latest times
            _updateCubit();
            cubit.submitCreateSession();
          },
        ),
      ],
    );
  }

  Widget _buildSelectionTile(BuildContext context, {required IconData icon, required String label, required String value, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.disabledGray.withAlpha(100)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: context.textTheme.bodySmall?.copyWith(color: AppTheme.disabledGray)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(icon, size: 18, color: AppTheme.primaryRed),
                const SizedBox(width: 8),
                Text(value, style: context.textTheme.titleMedium),
              ],
            ),
          ],
        ),
      ),
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
          initial: (_) => const LoadingIndicator(message: "Loading Gyms..."),
          loading: (_) => const LoadingIndicator(message: "Loading Gyms..."),
          error: (e) => Text('Error loading gyms: ${e.message}'),
          loaded: (s) {
            return DropdownButtonFormField<Gym>(
              decoration: const InputDecoration(
                labelText: 'Select Gym',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              items: s.gyms
                  .map((gym) => DropdownMenuItem(
                        value: gym,
                        child: Text(gym.name),
                      ))
                  .toList(),
              onChanged: (gym) {
                if (gym != null) createCubit.gymChanged(gym);
              },
            );
          },
        );
      },
    );
  }
}