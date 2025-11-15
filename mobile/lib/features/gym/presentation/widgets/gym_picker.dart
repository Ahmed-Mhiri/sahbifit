import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/gym/domain/entities/gym.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';

/// A dropdown widget that fetches and displays a list of approved gyms.
class GymPicker extends StatefulWidget {
  final Function(Gym gym) onGymSelected;
  final String? errorText;
  final Gym? initialValue;
  final String label;

  const GymPicker({
    super.key,
    required this.onGymSelected,
    this.errorText,
    this.initialValue,
    this.label = 'Select Gym',
  });

  @override
  State<GymPicker> createState() => _GymPickerState();
}

class _GymPickerState extends State<GymPicker> {
  Gym? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GymListCubit>()..fetchApprovedGyms(),
      child: BlocBuilder<GymListCubit, GymListState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildDropdown(context, isLoading: true),
            loading: () => _buildDropdown(context, isLoading: true),
            error: (message) => _buildDropdown(context, error: message),
            loaded: (gyms) => _buildDropdown(
              context,
              gyms: gyms,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    bool isLoading = false,
    String? error,
    List<Gym>? gyms,
  }) {
    // Ensure the selected value is still valid if the list reloads
    if (_selectedValue != null &&
        gyms != null &&
        !gyms.any((g) => g.gymId == _selectedValue!.gymId)) {
      _selectedValue = null;
    }

    return DropdownButtonFormField<Gym>(
      initialValue: _selectedValue,
      items: gyms
          ?.map((gym) => DropdownMenuItem<Gym>(
                value: gym,
                child: Text(gym.name),
              ))
          .toList(),
      onChanged: isLoading
          ? null
          : (Gym? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedValue = newValue;
                });
                widget.onGymSelected(newValue);
              }
            },
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: error ?? widget.errorText,
        prefixIcon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : const Icon(Icons.fitness_center_outlined),
      ),
      hint: Text(isLoading ? 'Loading gyms...' : 'Choose a gym'),
      disabledHint: Text(isLoading ? 'Loading gyms...' : 'No gyms available'),
      validator: (value) => value == null ? 'Please select a gym.' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}