import 'package:flutter/material.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/utils/icon_utils.dart';
import '../../../../shared_widgets/primary_button.dart';

class ChatInputField extends StatefulWidget {
  final bool isEnabled;
  final Function(String) onSendMessage;
  final String? placeholder;

  const ChatInputField({
    super.key,
    required this.isEnabled,
    required this.onSendMessage,
    this.placeholder = 'Type a message...',
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isNotEmpty && widget.isEnabled) {
      widget.onSendMessage(message);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppTheme.lightGrayUI),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.isEnabled,
              decoration: InputDecoration(
                hintText: widget.isEnabled
                    ? widget.placeholder
                    : 'Chat is not active',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: widget.isEnabled
                    ? AppTheme.lightGrayUI
                    : Colors.grey[100],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                suffixIcon: widget.isEnabled
                    ? IconButton(
                        icon: Icon(IconUtils.sendMessageIcon,
                            color: AppTheme.primaryRed),
                        onPressed: _sendMessage,
                      )
                    : Icon(IconUtils.lockIcon, color: AppTheme.disabledGray),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}