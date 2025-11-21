import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:sahbifit/core/utils/date_formatters.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/presentation/widgets/probation_locked_tooltip.dart';
import 'package:sahbifit/features/user/domain/enums/user_role.dart';
import 'package:sahbifit/shared/widgets/cards/custom_cards.dart';

class SessionCardWrapper extends StatelessWidget {
  final Session session;
  final bool isLocked;
  final bool isPast; // <--- 1. Add this

  const SessionCardWrapper({
    super.key,
    required this.session,
    required this.isLocked,
    this.isPast = false, // <--- 2. Default to false
  });

  @override
  Widget build(BuildContext context) {
    // Check if the creator is an Ambassador
    final bool isAmbassadorSession =
        session.creator.role == UserRole.admin; 

    // 3. Create the base card
    Widget card = SessionCard(
      title: session.title,
      subtitle: 'Hosted by ${session.creator.firstName}',
      time: formatReadableTime(session.startTime.toIso8601String()),
      location: session.gym.name,
      participants: session.participantCount,
      maxParticipants: session.maxParticipants,
      isLocked: isLocked,
      isVerified: isAmbassadorSession,
      onTap: () {
        // Allow clicking past sessions to see details, but maybe not join?
        // For now, we keep navigation enabled.
        context.push('/session/${session.sessionId}');
      },
    );

    // 4. Apply "Past" Visuals (Grayscale + Dimmed)
    if (isPast) {
      card = ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.grey, 
          BlendMode.saturation, // Removes color (grayscale)
        ),
        child: Opacity(
          opacity: 0.7, // Makes it slightly faded
          child: card,
        ),
      );
    }

    // 5. Handle Locking (Only if NOT past, assuming history shouldn't be locked)
    if (isLocked && !isPast) {
      return GestureDetector(
        onTap: () => showProbationLockedDialog(context),
        child: card,
      );
    } else {
      return card;
    }
  }
}