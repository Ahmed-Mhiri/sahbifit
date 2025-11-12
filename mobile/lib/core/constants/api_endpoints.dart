class ApiEndpoints {
  // --- Auth ---
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String verifySms = '/auth/verify-sms';
  static const String resendOtp = '/auth/resend-otp';

  // --- Gym ---
  static const String gyms = '/gyms';
  static const String submitGym = '/gyms/submit';

  // --- Tag ---
  static const String tags = '/tags';

  // --- Session ---
  static const String sessions = '/sessions';
  static const String createSession = '/sessions';
  static const String markAttendance = '/sessions/attendance';
  static String joinSession(String sessionId) => '/sessions/$sessionId/join';

  // --- 
  // 💡 NEWLY ADDED 
  // ---
  static const String myProfile = '/users/me'; // Assumed endpoint for getting current user
  static const String updateFcmToken = '/users/me/fcm-token';
  static const String updateVisibility = '/users/me/visibility';
  // Dynamic endpoints for user actions
  static String getUserProfile(String userId) => '/users/$userId'; // Assumed
  static String blockUser(String userId) => '/users/$userId/block';


  // --- 
  // 💡 NEWLY ADDED 
  // ---
  static const String verificationStatus = '/verification/status';
  static const String submitVerification = '/verification/submit';

  // --- 
  // 💡 NEWLY ADDED 
  // ---
  static const String ratings = '/ratings';
  static const String pendingRatings = '/ratings/pending';
  // Dynamic endpoint for getting a user's ratings
  static String ratingsForUser(String userId) => '/ratings/user/$userId';

  static const String reports = '/reports';


  
}