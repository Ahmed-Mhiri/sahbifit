import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:sahbifit/core/config/app_router.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/repositories/user_repository.dart';

// This must be a top-level function (not part of a class)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("--- Handling a background message: ${message.messageId}");
  // You can't do navigation here, but you can process data
}

@lazySingleton
class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final UserRepository _userRepository;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  PushNotificationService(this._userRepository);

  Future<void> init() async {
    // 1. Request permissions (iOS/macOS)
    await _requestPermissions();

    // 2. Initialize local notifications for foreground display
    await _initLocalNotifications();

    // 3. Get the FCM token and send it to the backend
    await _initToken();

    // 4. Set up message handlers
    _setupMessageHandlers();
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _initToken() async {
    try {
      final String? token = await _fcm.getToken();
      if (token != null) {
        print("--- FCM Token: $token ---");
        await _userRepository.updateFcmToken(token);
      }

      // Listen for token refreshes
      _fcm.onTokenRefresh.listen((newToken) async {
        print("--- FCM Token Refreshed: $newToken ---");
        await _userRepository.updateFcmToken(newToken);
      });
    } catch (e) {
      print("Error getting/sending FCM token: $e");
    }
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap when app is in foreground
        if (response.payload != null && response.payload!.isNotEmpty) {
          final data = jsonDecode(response.payload!) as Map<String, dynamic>;
          _handleNotificationTap(data);
        }
      },
    );
  }

  void _setupMessageHandlers() {
    // 1. App is in the FOREGROUND
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("--- FCM Message (Foreground): ${message.notification?.title}");

      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;

      // Show a local notification
      if (notification != null) {
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: android != null
                ? AndroidNotificationDetails(
                    'sahbifit_channel_id',
                    'SahbiFit Notifications',
                    channelDescription: 'Main notification channel',
                    importance: Importance.max,
                    priority: Priority.high,
                  )
                : null,
            iOS: const DarwinNotificationDetails(presentSound: true),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    // 2. App is in the BACKGROUND (but not terminated) and user taps notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("--- FCM Message (OpenedApp): ${message.data['type']}");
      _handleNotificationTap(message.data);
    });

    // 3. App is TERMINATED and user taps notification
    _fcm.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print("--- FCM Message (Initial): ${message.data['type']}");
        _handleNotificationTap(message.data);
      }
    });

    // 4. Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// This is the main routing logic based on your backend's data payload.
  void _handleNotificationTap(Map<String, dynamic> data) {
    final String? type = data['type'];
    if (type == null) return;

    // Use getIt to find the AppRouter
    final appRouter = getIt<AppRouter>();

    switch (type) {
      case 'VERIFICATION_APPROVED':
      case 'VERIFICATION_REJECTED':
        // Navigate to the user's profile using GoRouter
        appRouter.router.go('/profile');
        break;

      case 'PENDING_RATING':
        // This matches 'sendRatingReminder' from your backend
        final String? sessionId = data['sessionId'];
        if (sessionId != null) {
          // Navigate to the pending ratings page using GoRouter
          appRouter.router.go('/pending-ratings');
        }
        break;

      default:
        // Default action, go to home using GoRouter
        appRouter.router.go('/home');
    }
  }
}