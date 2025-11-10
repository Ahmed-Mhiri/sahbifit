import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit_mobile/app/bloc/app_bloc.dart';
import 'package:sahbifit_mobile/core/di/service_locator.dart';
import 'package:sahbifit_mobile/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:sahbifit_mobile/features/chat/presentation/cubit/chat_state.dart';
import 'package:sahbifit_mobile/features/chat/presentation/widgets/chat_disabled_placeholder.dart';
import 'package:sahbifit_mobile/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:sahbifit_mobile/features/chat/presentation/widgets/chat_logistics_header.dart';
import 'package:sahbifit_mobile/features/chat/presentation/widgets/message_bubble.dart';
import 'package:sahbifit_mobile/features/session/domain/entities/session.dart';
import 'package:sahbifit_mobile/shared_widgets/loading_spinner.dart';

class ChatPage extends StatelessWidget {
  final Session session;

  const ChatPage({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    // Check if the backend has created the chat room yet.
    // Your SessionEventListener sets this.
    if (session.firestoreChatId == null || session.firestoreChatId!.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Session Chat')),
        body: ChatDisabledPlaceholder.notCreated(),
      );
    }

    // Get the current user from the AppBloc
    final currentUser = context.read<AppBloc>().state.user;

    return BlocProvider(
      create: (context) => sl<ChatCubit>(param1: currentUser)
        ..loadMessages(session.firestoreChatId!),
      child: Scaffold(
        appBar: AppBar(title: const Text('Session Chat')),
        body: Column(
          children: [
            // This header uses `isChatActive` to show the correct info
            ChatLogisticsHeader(
              sessionTitle: session.title,
              sessionTime: session.startTime,
              isChatActive: session.isChatActive,
            ),
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const LoadingSpinner(),
                    loading: () => const LoadingSpinner(),
                    error: (message) => Center(child: Text(message)),
                    success: (messages) {
                      if (messages.isEmpty) {
                        return ChatDisabledPlaceholder.noMessages();
                      }

                      return ListView.builder(
                        reverse: true, // Shows latest messages at the bottom
                        padding: const EdgeInsets.all(8.0),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return MessageBubble(
                            message: message.text,
                            timestamp: message.timestamp,
                            isMe: message.senderId == currentUser.userId,
                            senderName: message.senderName,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            // This input field also uses `isChatActive`
            ChatInputField(
              isEnabled: session.isChatActive,
              onSendMessage: (text) {
                context
                    .read<ChatCubit>()
                    .sendMessage(session.firestoreChatId!, text);
              },
            ),
          ],
        ),
      ),
    );
  }
}