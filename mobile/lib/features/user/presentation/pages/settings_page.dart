import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_state.dart';
import 'package:sahbifit/features/user/presentation/widgets/visibility_settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        // This page assumes ProfileBloc is already loaded with the
        // current user's data (e.g., provided from ProfilePage).
        builder: (context, state) {
          if (state is ProfileLoaded && state.isCurrentUser) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  VisibilitySettingsWidget(
                    currentUser: state.user,
                  ),
                  const Divider(height: 32),
                  // ... Other settings ...
                  Text(
                    'Account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    onTap: () {
                      // Dispatch a logout event to your AuthBloc
                    },
                  ),
                ],
              ),
            );
          }
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          // Default/Initial state
          return const Center(
              child: Text('Loading settings...'));
        },
      ),
    );
  }
}