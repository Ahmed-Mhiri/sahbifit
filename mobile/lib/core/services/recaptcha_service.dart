import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_action.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // <-- ADDED IMPORT

@lazySingleton
class ReCaptchaService {
  static final String _androidSiteKey =
      dotenv.env['RECAPTCHA_ANDROID_SITE_KEY'] ?? 'MISSING_ANDROID_KEY';
  static final String _iosSiteKey =
      dotenv.env['RECAPTCHA_IOS_SITE_KEY'] ?? 'MISSING_IOS_KEY';

  late RecaptchaClient _client;
  bool _isInitialized = false;

  Future<void> init() async {
    try {
      if (_isInitialized) return;

      // Determine the correct site key based on platform
      final String siteKey;
      if (kIsWeb) {
        debugPrint("reCAPTCHA Enterprise for web is not supported by this package");
        return;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        siteKey = _androidSiteKey;
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        siteKey = _iosSiteKey;
      } else {
        debugPrint("Unsupported platform for reCAPTCHA Enterprise");
        return;
      }

      _client = await Recaptcha.fetchClient(siteKey);
      _isInitialized = true;
      debugPrint("reCAPTCHA Enterprise initialized for ${defaultTargetPlatform}");
    } catch (e) {
      debugPrint("Error initializing reCAPTCHA Enterprise: $e");
      throw Exception("Failed to initialize reCAPTCHA Enterprise: $e");
    }
  }

  /// Gets a reCAPTCHA Enterprise token for a specific action
  Future<String> getToken(String action) async {
    if (!_isInitialized) {
      debugPrint("reCAPTCHA not initialized, attempting to init now...");
      await init();
      if (!_isInitialized) {
        throw Exception("reCAPTCHA Enterprise failed to initialize");
      }
    }

    try {
      final String token = await _client.execute(RecaptchaAction.custom(action));
      debugPrint(
          "reCAPTCHA Enterprise token for action '$action': ${token.substring(0, 50)}...");
      return token;
    } catch (e) {
      debugPrint("Error executing reCAPTCHA Enterprise action '$action': $e");
      throw Exception("Failed to get reCAPTCHA token: $e");
    }
  }

  /// Convenience methods for common actions
  Future<String> getLoginToken() => getToken('login');
  Future<String> getRegisterToken() => getToken('register');
  Future<String> getResendOtpToken() => getToken('resend-otp');

  /// Clean up resources when done
  Future<void> dispose() async {
    if (_isInitialized) {
      // Note: The guide doesn't show a dispose method, but you can keep this
      // if the package supports it, or remove it if not needed
      _isInitialized = false;
    }
  }

  bool get isInitialized => _isInitialized;
}