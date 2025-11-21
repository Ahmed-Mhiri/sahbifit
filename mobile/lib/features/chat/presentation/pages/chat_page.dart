import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart';
import 'package:sahbifit/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:sahbifit/features/chat/presentation/widgets/chat_disabled_placeholder.dart';
import 'package:sahbifit/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:sahbifit/features/chat/presentation/widgets/message_bubble.dart';
import 'package:sahbifit/features/session/presentation/cubit/session_details_cubit.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';

class ChatPage extends StatelessWidget {
  final String sessionId;

  const ChatPage({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    // We need Session details to check start/end times
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ChatCubit>()..listenToChat(sessionId)),
        // We need session details to know the times
        BlocProvider(create: (context) => getIt<SessionDetailsCubit>()), 
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          return profileState.maybeWhen(
            loaded: (user) {
              // Trigger load session details to get times
              context.read<SessionDetailsCubit>().fetchSessionDetails(sessionId, user.userId);
              
              return Scaffold(
                appBar: const CustomAppBar(title: 'Session Chat'),
                body: BlocBuilder<SessionDetailsCubit, SessionDetailsState>(
                  builder: (context, sessionState) {
                    return sessionState.maybeWhen(
                      // FIX APPLIED: Added '___' to handle the 6th parameter (errorMessage)
                      loaded: (session, participants, isJoined, _, __, ___) {
                        
                        // --- 1 HOUR RULE LOGIC ---
                        final now = DateTime.now();
                        final chatStart = session.startTime.subtract(const Duration(hours: 1));
                        final chatEnd = session.endTime.add(const Duration(hours: 1));
                        final bool isChatActive = now.isAfter(chatStart) && now.isBefore(chatEnd);
                        
                        return Column(
                          children: [
                            // Logistics / Warning Header
                            if (!isChatActive)
                              Container(
                                width: double.infinity,
                                color: AppTheme.warningYellow.withAlpha(50),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  now.isBefore(chatStart) 
                                      ? "Chat opens 1 hour before session."
                                      : "Session ended. Chat is read-only.",
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.darkGray
                                  ),
                                ),
                              ),

                            Expanded(
                              child: BlocBuilder<ChatCubit, ChatState>(
                                builder: (context, chatState) {
                                  return chatState.when(
                                    initial: () => const SizedBox.shrink(),
                                    loading: () => const LoadingIndicator(),
                                    error: (msg) => Center(child: Text(msg)),
                                    loaded: (messages) => _buildChatList(context, messages, user.userId),
                                  );
                                },
                              ),
                            ),
                            
                            // Input Field (Disabled if outside time window)
                            ChatInputField(
                              enabled: isChatActive,
                              onSend: (text) {
                                context.read<ChatCubit>().sendMessage(
                                  sessionId: sessionId,
                                  senderId: user.userId,
                                  text: text,
                                );
                              },
                            ),
                          ],
                        );
                      },
                      loading: () => const LoadingIndicator(message: "Syncing session details..."),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              );
            },
            orElse: () => const Scaffold(body: LoadingIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildChatList(BuildContext context, List<Message> messages, String currentUserId) {
    if (messages.isEmpty) {
      return const ChatDisabledPlaceholder(
        title: 'Chat Quiet',
        message: 'No messages yet.',
        icon: Icons.chat_bubble_outline,
      );
    }

    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          message: message,
          isMe: message.senderId == currentUserId,
        );
      },
    );
  }
}