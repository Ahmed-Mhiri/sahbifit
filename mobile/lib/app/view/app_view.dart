// lib/app/view/app_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class AppView extends StatelessWidget {
  final GoRouter router;
  
  const AppView({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SahbiFit',
      theme: AppTheme.lightTheme,

      // Use the routerConfig from the router instance
      routerConfig: router,

      // KEEP THE BUILDER - This is still the best way to
      // handle the initial loading screen flash.
      builder: (context, child) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Scaffold(
                backgroundColor: AppTheme.cleanWhite,
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryRed,
                  ),
                ),
              ),
              // Once auth state is known (authenticated/unauthenticated),
              // the redirect logic will have run. We can show the page.
              orElse: () => child!,
            );
          },
        );
      },
    );
  }
}