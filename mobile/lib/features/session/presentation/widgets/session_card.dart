import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/presentation/widgets/probation_locked_tooltip.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/shared/widgets/cards/custom_cards.dart';

/// This widget is a wrapper that maps the domain [Session] entity
/// to the shared [SessionCard] widget, handling lock state and navigation.
class SessionCardWrapper extends StatelessWidget {
  final Session session;
  final bool isLocked;

  const SessionCardWrapper({
    super.key,
    required this.session,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the creator is an Ambassador (placeholder logic)
    // In a real app, this would check session.creator.badges
    final bool isAmbassadorSession =
        session.creator.role == UserRole.admin; // Assuming admin == ambassador for now

    final card = SessionCard(
      title: session.title,
      subtitle: 'Hosted by ${session.creator.firstName}',
      time: formatReadableTime(session.startTime.toIso8601String()),
      location: session.gym.name,
      participants: session.participantCount,
      maxParticipants: session.maxParticipants,
      isLocked: isLocked,
      isVerified: isAmbassadorSession, // Show "Verified" for ambassador sessions
      onTap: () {
        context.push('/session/${session.sessionId}');

      },
    );

    if (isLocked) {
      return GestureDetector(
        onTap: () => showProbationLockedDialog(context),
        child: card,
      );
    } else {
      return card;
    }
  }
}