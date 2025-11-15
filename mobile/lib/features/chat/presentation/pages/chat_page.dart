import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/chat/domain/entities/message.dart';
import 'package:sahbifit/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:sahbifit/features/chat/presentation/widgets/chat_disabled_placeholder.dart';
import 'package:sahbifit/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:sahbifit/features/chat/presentation/widgets/chat_logistics_header.dart';
import 'package:sahbifit/features/chat/presentation/widgets/message_bubble.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/states/loading_states.dart';

class ChatPage extends StatelessWidget {
  final String sessionId;

  const ChatPage({
    super.key,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context) {
    // Provides the Cubit to this page and its children.
    // It also triggers the initial data load.
    return BlocProvider(
      create: (context) => getIt<ChatCubit>()..listenToChat(sessionId),
      child: BlocBuilder<AppBloc, AppState>(
        // We need the AppBloc to get the current user's ID
        builder: (context, appState) {
          // Assume AppState has an 'authenticated' state with a 'user' object
          final currentUserId =
              appState.mapOrNull(authenticated: (state) => state.user.userId);

          if (currentUserId == null) {
            // This case should ideally not happen if routing is correct,
            // but it's good practice to handle it.
            return const Scaffold(
              body: LoadingIndicator(message: 'Authenticating...'),
            );
          }

          return Scaffold(
            appBar: const CustomAppBar(title: 'Session Chat'),
            body: Column(
              children: [
                const ChatLogisticsHeader(),
                Expanded(
                  // This builder handles the chat's own state
                  child: BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, chatState) {
                      return chatState.when(
                        initial: () => const SizedBox.shrink(),
                        loading: () =>
                            const LoadingIndicator(message: 'Loading chat...'),
                        error: (message) => ErrorStateWidget(
                          message: message,
                          buttonText: 'Retry',
                          onRetry: () {
                            context.read<ChatCubit>().listenToChat(sessionId);
                          },
                        ),
                        loaded: (messages) => _buildChatList(
                          context,
                          messages,
                          currentUserId,
                        ),
                      );
                    },
                  ),
                ),
                ChatInputField(
                  enabled: true, // Add logic here if chat can be disabled
                  onSend: (text) {
                    context.read<ChatCubit>().sendMessage(
                          sessionId: sessionId,
                          senderId: currentUserId,
                          text: text,
                        );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatList(
    BuildContext context,
    List<Message> messages,
    String currentUserId,
  ) {
    if (messages.isEmpty) {
      return const ChatDisabledPlaceholder(
        title: 'Chat is Empty',
        message: 'Be the first to send a message!',
        icon: Icons.chat_rounded,
      );
    }

    return ListView.builder(
      reverse: true, // This makes the chat feel natural
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