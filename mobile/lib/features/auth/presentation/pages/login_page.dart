import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/auth/presentation/widgets/login_form.dart';
import 'package:go_router/go_router.dart'; // ADD THIS IMPORT



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        backgroundColor: AppTheme.cleanWhite,
        body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                // loginSuccess is handled by the AppBloc state change,
                // which will trigger a navigation update.
                // We only need to show errors here.
                failure: (message) {
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Add your Logo here
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Text(
                    'Welcome Back',
                    style: context.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login to find your next workout partner.',
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.sectionSpacing * 2),
                  const LoginForm(),
                  const SizedBox(height: AppTheme.sectionSpacing),
                  _buildRegisterButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: context.textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            // Navigate to the registration page
            context.push('/register');
          },
          child: const Text('Register Now'),
        ),
      ],
    );
  }
}
