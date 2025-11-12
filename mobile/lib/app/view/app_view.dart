import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/config/app_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  // 1. Instantiate your AppRouter.
  // We make it static or a final field so it persists.
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      // 2. This BlocListener is the "router guard".
      // It listens for state changes from AppBloc and triggers navigation
      // as a side-effect. It does NOT rebuild the MaterialApp.
      listener: (context, state) {
        state.whenOrNull(
          authenticated: () {
            // When the AppBloc says "authenticated", we clear the
            // entire navigation stack and push the home page.
            _appRouter.replaceAll([const SessionFeedRoute()]);
          },
          unauthenticated: () {
            // When "unauthenticated", we clear the stack and
            // push the login page.
            _appRouter.replaceAll([const LoginRoute()]);
          },
        );
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'SahbiFit',
        
        // 3. Apply your custom theme from app_theme.dart
        theme: AppTheme.lightTheme,

        // 4. Connect the router to the MaterialApp
        routerConfig: _appRouter.config(),

        // 5. This builder shows a loading screen *only* during the
        // initial auth check (the 'initial' state of AppBloc).
        // This prevents a flash of the login screen if the user is
        // already logged in.
        builder: (context, router) {
          return BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return state.maybeWhen(
                initial: () => const Scaffold(
                  backgroundColor: AppTheme.cleanWhite, // From your theme
                  body: Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryRed, // From your theme
                    ),
                  ),
                ),
                // Once the state is 'authenticated' or 'unauthenticated',
                // the listener above will have already triggered the
                // navigation. We can then safely show the page
                // provided by the router.
                orElse: () => router!,
              );
            },
          );
        },
      ),
    );
  }
}