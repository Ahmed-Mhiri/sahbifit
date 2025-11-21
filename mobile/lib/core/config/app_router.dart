import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';

// --- Bloc/Cubit Imports ---
import 'package:sahbifit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sahbifit/features/gym/presentation/cubit/gym_list_cubit.dart';
import 'package:sahbifit/features/tag/presentation/cubit/tags_cubit.dart';

// --- Shared Widgets ---
import '../../shared/widgets/scaffold_with_navbar.dart';

// --- Page Imports ---
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/verify_sms_page.dart';
import '../../features/session/presentation/pages/session_feed_page.dart';
import '../../features/session/presentation/pages/session_details_page.dart';
import '../../features/session/presentation/pages/create_session_page.dart';
import '../../features/session/presentation/pages/mark_attendance_page.dart';
import '../../features/session/presentation/pages/my_sessions_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/user/presentation/pages/profile_page.dart';
import '../../features/user/presentation/pages/settings_page.dart';
import '../../features/user/presentation/pages/blocked_users_page.dart';
import '../../features/verification/presentation/pages/submit_verification_page.dart';
import '../../features/rating/presentation/pages/pending_ratings_page.dart';
import '../../features/report/presentation/pages/report_user_page.dart';
import '../../features/gym/presentation/pages/submit_gym_page.dart';

// --- New Imports (Chat List & Manage Activity) ---
import '../../features/chat/presentation/pages/chat_list_page.dart';
import '../../features/user/presentation/pages/manage_activity_page.dart';

class AppRouter {
  final AppBloc appBloc;
  late final GoRouter router;

  AppRouter(this.appBloc) {
    router = GoRouter(
      refreshListenable: GoRouterRefreshStream(appBloc.stream),
      initialLocation: '/login',
      redirect: (BuildContext context, GoRouterState state) {
        final appState = appBloc.state;
        final location = state.matchedLocation;
        final authRoutes = ['/login', '/register', '/verify-sms'];

        return appState.mapOrNull(
          initial: (_) => null,
          unauthenticated: (_) {
            if (authRoutes.contains(location)) return null;
            return '/login';
          },
          authenticated: (_) {
            if (authRoutes.contains(location)) return '/home';
            return null;
          },
        );
      },
      routes: [
        // --- Auth Routes ---
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<AuthBloc>()),
                BlocProvider(create: (context) => getIt<GymListCubit>()),
                BlocProvider(create: (context) => getIt<TagsCubit>()),
              ],
              child: const RegisterPage(),
            );
          },
        ),
        GoRoute(
          path: '/verify-sms',
          builder: (context, state) {
            final phoneNumber = state.extra as String;
            return VerifySmsPage(phoneNumber: phoneNumber);
          },
        ),

        // --- Shell Route (Bottom Navbar) ---
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            // 1. Home / Feed
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const SessionFeedPage(),
                ),
              ],
            ),
            // 2. My Sessions (Calendar)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/my-sessions',
                  builder: (context, state) => const MySessionsPage(),
                ),
              ],
            ),
            // 3. Chat List (NEW)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/chats',
                  builder: (context, state) => const ChatListPage(),
                ),
              ],
            ),
            // 4. Manage / Activity (NEW - Ratings & Attendance)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/manage',
                  builder: (context, state) => const ManageActivityPage(),
                ),
              ],
            ),
            // 5. Profile
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (context, state) => const ProfilePage(userId: null),
                ),
              ],
            ),
          ],
        ),

        // --- Overlay Pages ---
        GoRoute(
          path: '/create-session',
          builder: (context, state) => const CreateSessionPage(),
        ),
        GoRoute(
          path: '/session/:sessionId',
          builder: (context, state) {
            final sessionId = state.pathParameters['sessionId']!;
            return SessionDetailsPage(sessionId: sessionId);
          },
          routes: [
            GoRoute(
              path: 'chat',
              builder: (context, state) {
                final sessionId = state.pathParameters['sessionId']!;
                return ChatPage(sessionId: sessionId);
              },
            ),
            GoRoute(
              path: 'attendance',
              builder: (context, state) {
                final sessionId = state.pathParameters['sessionId']!;
                return MarkAttendancePage(sessionId: sessionId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/user/:userId',
          builder: (context, state) {
            final userId = state.pathParameters['userId']!;
            return ProfilePage(userId: userId);
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: '/pending-ratings',
          builder: (context, state) => const PendingRatingsPage(),
        ),
        GoRoute(
          path: '/submit-verification',
          builder: (context, state) => const SubmitVerificationPage(),
        ),
        GoRoute(
          path: '/report-user',
          builder: (context, state) {
            final args = state.extra as Map<String, dynamic>;
            return ReportUserPage(
              reportedUserId: args['reportedUserId'] as String,
              sessionId: args['sessionId'] as String?,
            );
          },
        ),
        GoRoute(
          path: '/submit-gym',
          builder: (context, state) => const SubmitGymPage(),
        ),
        GoRoute(
          path: '/blocked-users',
          builder: (context, state) => const BlockedUsersPage(),
        ),
      ],
    );
  }
}

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