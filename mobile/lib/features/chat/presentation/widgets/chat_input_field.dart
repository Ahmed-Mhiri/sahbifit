import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class ChatInputField extends StatefulWidget {
  final bool enabled;
  final Function(String text) onSend;

  const ChatInputField({
    super.key,
    this.enabled = true,
    required this.onSend,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final canSend = _controller.text.trim().isNotEmpty;
      if (canSend != _canSend) {
        setState(() {
          _canSend = canSend;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (_canSend && widget.enabled) {
      widget.onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isEffectivelyEnabled = widget.enabled && _canSend;

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: AppTheme.cleanWhite,
        boxShadow: [
          BoxShadow(
            color: AppTheme.darkGray.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: widget.enabled,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: widget.enabled
                    ? 'Type a message...'
                    : 'Chat is not available',
                filled: true,
                fillColor: AppTheme.lightGray,
                border: theme.inputDecorationTheme.border,
                enabledBorder: theme.inputDecorationTheme.enabledBorder,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onSubmitted: (_) => _handleSend(),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.send_rounded),
            iconSize: 24,
            color: isEffectivelyEnabled
                ? AppTheme.primaryRed
                : AppTheme.disabledGray,
            onPressed: isEffectivelyEnabled ? _handleSend : null,
          ),
        ],
      ),
    );
  }
}
