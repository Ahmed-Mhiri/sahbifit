import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_event.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_state.dart';
import 'package:sahbifit/features/user/presentation/widgets/block_user_button.dart';
import 'package:sahbifit/features/user/presentation/widgets/profile_header.dart';
import 'package:sahbifit/features/user/presentation/widgets/user_badge_list.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;

  const ProfilePage({super.key, this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Load the profile when the page is first built
    context.read<ProfileBloc>().add(LoadProfile(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ProfileUpdateFailed) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading && state is! ProfileLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError) {
            return Center(
              child: Text(
                'Failed to load profile: ${state.message}',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is ProfileLoaded) {
            final user = state.user;
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<ProfileBloc>()
                    .add(LoadProfile(userId: widget.userId));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProfileHeader(
                      userName: user.firstName,
                      age: user.age,
                      avatarUrl: user.profilePhotoUrl,
                      gymName: user.primaryGymName,
                      rating: user.averageRating,
                      sessionsCompleted: user.groupSessionCount,
                      isVerified: user.isVerified,
                      isCurrentUser: state.isCurrentUser,
                    ),
                    const SizedBox(height: 16),
                    UserBadgeList(badges: user.badges),
                    const SizedBox(height: 16),
                    if (!state.isCurrentUser)
                      BlockUserButton(
                        userId: user.id,
                        userName: user.firstName,
                        onBlockUser: (userId) {
                          context
                              .read<ProfileBloc>()
                              .add(BlockUserEvent(userId: userId));
                        },
                      ),
                  ],
                ),
              ),
            );
          }

          // Initial state
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}