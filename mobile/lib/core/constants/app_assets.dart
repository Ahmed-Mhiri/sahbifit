// lib/core/constants/app_assets.dart

class AppAssets {
  // Logo assets (keep your custom logos)
  static const String logo = 'assets/logo/logo.png';
  static const String logoWithName = 'assets/logo/logo_with_name.png';
  
  // Custom illustrations only - download these from Icons8/Flaticon
  static const String emptySessions = 'assets/illustrations/empty_sessions.svg';
  static const String emptyChat = 'assets/illustrations/empty_chat.svg';
  static const String emptyRatings = 'assets/illustrations/empty_ratings.svg';
  static const String verificationPending = 'assets/illustrations/verification_pending.svg';
  static const String workoutIllustration = 'assets/illustrations/workout.svg';
  
  // Custom images only
  static const String placeholderAvatar = 'assets/images/placeholder_avatar.png';
  static const String gymPlaceholder = 'assets/images/gym_placeholder.png';
  static const String appStoreBadge = 'assets/images/app_store_badge.png';
  static const String googlePlayBadge = 'assets/images/google_play_badge.png';
  
  // No icon assets needed anymore - we use IconUtils instead!
}

// Empty state configurations
class EmptyStateConfig {
  final String illustration;
  final String title;
  final String description;
  final String actionText;
  
  const EmptyStateConfig({
    required this.illustration,
    required this.title,
    required this.description,
    required this.actionText,
  });
  
  // Pre-configured empty states
  static const EmptyStateConfig noSessions = EmptyStateConfig(
    illustration: AppAssets.emptySessions,
    title: 'No Sessions Yet',
    description: 'Be the first to post a workout session in your area!',
    actionText: 'Post First Session',
  );
  
  static const EmptyStateConfig noChats = EmptyStateConfig(
    illustration: AppAssets.emptyChat,
    title: 'No Messages',
    description: 'Your session-related messages will appear here',
    actionText: 'Browse Sessions',
  );
  
  static const EmptyStateConfig noRatings = EmptyStateConfig(
    illustration: AppAssets.emptyRatings,
    title: 'No Ratings Yet',
    description: 'Complete sessions with others to receive ratings',
    actionText: 'Join a Session',
  );
  
  static const EmptyStateConfig verificationPending = EmptyStateConfig(
    illustration: AppAssets.verificationPending,
    title: 'Verification in Progress',
    description: 'Your profile is being verified. This usually takes less than 12 hours.',
    actionText: 'Learn More',
  );
}