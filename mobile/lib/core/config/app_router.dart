import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// --- Import all Page files ---

// Auth
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/verify_sms_page.dart';

// Session
import '../../features/session/presentation/pages/session_feed_page.dart';
import '../../features/session/presentation/pages/session_details_page.dart';
import '../../features/session/presentation/pages/create_session_page.dart';
import '../../features/session/presentation/pages/mark_attendance_page.dart';

// Chat
import '../../features/chat/presentation/pages/chat_page.dart';

// User & Profile
import '../../features/user/presentation/pages/profile_page.dart';
import '../../features/user/presentation/pages/settings_page.dart';

// Verification
import '../../features/verification/presentation/pages/submit_verification_page.dart';

// Rating
import '../../features/rating/presentation/pages/pending_ratings_page.dart';

// Report
import '../../features/report/presentation/pages/report_user_page.dart';

// Gym
import '../../features/gym/presentation/pages/submit_gym_page.dart';

// This generated file must be created by running build_runner
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // --- Auth Flow ---
        // LoginPage is the initial route.
        // Your AppBloc will navigate away to /home if already authenticated.
        AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
        AutoRoute(page: RegisterRoute.page, path: '/register'),

        // This page requires the phone number from the registration step.
        // The VerifySmsPage constructor must accept `String phoneNumber`.
        AutoRoute(page: VerifySmsRoute.page, path: '/verify-sms'),

        // --- Main App (Authenticated) ---
        // This is your main "home" screen for authenticated users.
        AutoRoute(page: SessionFeedRoute.page, path: '/home'),
        AutoRoute(page: CreateSessionRoute.page, path: '/create-session'),

        // This page needs the session ID passed as a URL path parameter.
        // The SessionDetailsPage constructor must accept:
        // `String @PathParam('sessionId') sessionId`
        AutoRoute(
          page: SessionDetailsRoute.page,
          path: '/session/:sessionId',
        ),

        // This page also needs the session ID.
        // The ChatPage constructor must accept:
        // `String @PathParam('sessionId') sessionId`
        AutoRoute(
          page: ChatRoute.page,
          path: '/session/:sessionId/chat',
        ),

        // This page also needs the session ID.
        // The MarkAttendancePage constructor must accept:
        // `String @PathParam('sessionId') sessionId`
        AutoRoute(
          page: MarkAttendanceRoute.page,
          path: '/session/:sessionId/attendance',
        ),

        // --- User & Profile ---
        // We define two routes that point to the same ProfilePage.
        // The ProfilePage constructor must accept `String? @PathParam('userId') userId`.
        // 1. When navigating to '/profile', userId will be null (My Profile).
        // 2. When navigating to '/user/some-uuid', userId will be populated.
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
        AutoRoute(page: ProfileRoute.page, path: '/user/:userId'),

        AutoRoute(page: SettingsRoute.page, path: '/settings'),

        // --- Trust & Safety ---
        AutoRoute(
          page: SubmitVerificationRoute.page,
          path: '/submit-verification',
        ),
        // This page's constructor will take:
        // `String reportedUserId` and `String? sessionId`.
        AutoRoute(
          page: ReportUserRoute.page,
          path: '/report-user',
        ),

        // --- Accountability ---
        AutoRoute(
          page: PendingRatingsRoute.page,
          path: '/pending-ratings',
        ),

        // --- Other Features ---
        AutoRoute(
          page: SubmitGymRoute.page,
          path: '/submit-gym',
        ),
      ];
}