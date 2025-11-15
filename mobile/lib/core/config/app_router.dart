// lib/core/config/app_router.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';

// --- Import all your Page files ---
// You will get errors here until you remove the @RoutePage() 
// annotations from these files in a later step.
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/verify_sms_page.dart';
import '../../features/session/presentation/pages/session_feed_page.dart';
import '../../features/session/presentation/pages/session_details_page.dart';
import '../../features/session/presentation/pages/create_session_page.dart';
import '../../features/session/presentation/pages/mark_attendance_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/user/presentation/pages/profile_page.dart';
import '../../features/user/presentation/pages/settings_page.dart';
import '../../features/verification/presentation/pages/submit_verification_page.dart';
import '../../features/rating/presentation/pages/pending_ratings_page.dart';
import '../../features/report/presentation/pages/report_user_page.dart';
import '../../features/gym/presentation/pages/submit_gym_page.dart';

/// A wrapper class to hold the GoRouter instance.
/// This allows us to pass the AppBloc to the redirect logic.
class AppRouter {
  final AppBloc appBloc;
  late final GoRouter router;

  AppRouter(this.appBloc) {
    router = GoRouter(
      // 1. Listen to the AppBloc stream for auth changes
      refreshListenable: GoRouterRefreshStream(appBloc.stream),

      // 2. Set the initial route
      initialLocation: '/login',

      // 3. Define the auth redirect logic
      redirect: (BuildContext context, GoRouterState state) {
        final appState = appBloc.state;
        final location = state.matchedLocation;

        // Define auth-only routes
        final authRoutes = [
          '/login',
          '/register',
          '/verify-sms',
        ];

        // If the app is still checking auth, don't redirect.
        // The AppView's builder will show a loading screen.
        if (appState is _Initial) {
          return null;
        }

        // Handle unauthenticated users
        if (appState is _Unauthenticated) {
          // If the user is on an auth page, allow them.
          if (authRoutes.contains(location)) {
            return null;
          }
          // Otherwise, redirect to login.
          return '/login';
        }

        // Handle authenticated users
        if (appState is _Authenticated) {
          // If the user is on an auth page, redirect to home.
          if (authRoutes.contains(location)) {
            return '/home';
          }
          // Otherwise, allow them to go anywhere.
          return null;
        }

        return null; // Default case
      },

      // 4. Define all your app routes
      routes: [
        // --- Auth Flow ---
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/verify-sms',
          builder: (context, state) {
            // Get arguments passed via `extra`
            final phoneNumber = state.extra as String;
            return VerifySmsPage(phoneNumber: phoneNumber);
          },
        ),

        // --- Main App (Authenticated) ---
        GoRoute(
          path: '/home',
          builder: (context, state) => const SessionFeedPage(),
        ),
        GoRoute(
          path: '/create-session',
          builder: (context, state) => const CreateSessionPage(),
        ),

        // --- Nested Session Routes ---
        GoRoute(
          path: '/session/:sessionId',
          builder: (context, state) {
            // Get path parameters
            final sessionId = state.pathParameters['sessionId']!;
            return SessionDetailsPage(sessionId: sessionId);
          },
          routes: [
            // Path becomes: /session/:sessionId/chat
            GoRoute(
              path: 'chat',
              builder: (context, state) {
                final sessionId = state.pathParameters['sessionId']!;
                return ChatPage(sessionId: sessionId);
              },
            ),
            // Path becomes: /session/:sessionId/attendance
            GoRoute(
              path: 'attendance',
              builder: (context, state) {
                final sessionId = state.pathParameters['sessionId']!;
                return MarkAttendancePage(sessionId: sessionId);
              },
            ),
          ],
        ),

        // --- User & Profile ---
        GoRoute(
          path: '/profile', // My profile
          builder: (context, state) => const ProfilePage(userId: null),
        ),
        GoRoute(
          path: '/user/:userId', // Other user's profile
          builder: (context, state) {
            final userId = state.pathParameters['userId']!;
            return ProfilePage(userId: userId);
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),

        // --- Trust & Safety ---
        GoRoute(
          path: '/submit-verification',
          builder: (context, state) => const SubmitVerificationPage(),
        ),
        GoRoute(
          path: '/report-user',
          builder: (context, state) {
            // Arguments can be passed via `extra` as a Map or custom class
            final args = state.extra as Map<String, dynamic>;
            return ReportUserPage(
              reportedUserId: args['reportedUserId'] as String,
              sessionId: args['sessionId'] as String?,
            );
          },
        ),

        // --- Other Features ---
        GoRoute(
          path: '/pending-ratings',
          builder: (context, state) => const PendingRatingsPage(),
        ),
        GoRoute(
          path: '/submit-gym',
          builder: (context, state) => const SubmitGymPage(),
        ),
      ],
    );
  }
}

/// A simple [ChangeNotifier] that listens to a [Stream]
/// and notifies listeners on new events.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}