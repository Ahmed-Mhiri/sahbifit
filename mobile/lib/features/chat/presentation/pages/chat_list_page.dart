import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/session/domain/entities/session.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_cubit.dart';
import 'package:sahbifit/features/session/presentation/cubit/my_sessions_state.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:intl/intl.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // We reuse MySessionsCubit to get sessions I've joined. 
    // These are effectively my chats.
    return BlocProvider(
      create: (context) => getIt<MySessionsCubit>()..loadMySessions(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Conversations', showBackButton: false),
        body: BlocBuilder<MySessionsCubit, MySessionsState>(
          builder: (context, state) {
            if (state is MySessionsLoading) {
              return const LoadingIndicator();
            } else if (state is MySessionsError) {
              return ErrorStateWidget(
                message: state.message,
                buttonText: 'Retry',
                onRetry: () => context.read<MySessionsCubit>().loadMySessions(),
              );
            } else if (state is MySessionsLoaded) {
              // Combine past and upcoming sessions for chat history
              final allSessions = [...state.upcomingSessions, ...state.pastSessions];
              
              if (allSessions.isEmpty) {
                return const EmptyStateWidget(
                  icon: Icons.chat_bubble_outline,
                  title: 'No Conversations',
                  message: 'Join a session to start chatting with others.',
                );
              }

              return ListView.separated(
                itemCount: allSessions.length,
                separatorBuilder: (ctx, i) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final session = allSessions[index];
                  return _ChatListItem(session: session);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _ChatListItem extends StatelessWidget {
  final Session session;

  const _ChatListItem({required this.session});

  @override
  Widget build(BuildContext context) {
    // Check if chat is theoretically active (1 hour window)
    final now = DateTime.now();
    final chatStart = session.startTime.subtract(const Duration(hours: 1));
    final chatEnd = session.endTime.add(const Duration(hours: 1));
    final isChatActive = now.isAfter(chatStart) && now.isBefore(chatEnd);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isChatActive ? AppTheme.primaryRed.withAlpha(20) : AppTheme.lightGray,
        child: Icon(
          Icons.group, 
          color: isChatActive ? AppTheme.primaryRed : AppTheme.disabledGray
        ),
      ),
      title: Text(
        session.title, 
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLines: 1, overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              isChatActive ? "Chat is active now" : "Chat archive",
              style: TextStyle(
                color: isChatActive ? AppTheme.successGreen : AppTheme.disabledGray,
                fontWeight: isChatActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
          Text(
            DateFormat('MMM d').format(session.startTime),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        context.push('/session/${session.sessionId}/chat');
      },
    );
  }
}