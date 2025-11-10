import 'package:flutter/material.dart';
import '../../../../../shared_widgets/theme_components.dart';

class BlockUserButton extends StatelessWidget {
  final String userId;
  final String userName;
  final Function(String) onBlockUser;

  const BlockUserButton({
    super.key,
    required this.userId,
    required this.userName,
    required this.onBlockUser,
  });

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      text: 'Block User',
      onPressed: () => _showBlockConfirmation(context),
      icon: Icons.block,
    );
  }

  void _showBlockConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block User'),
        content: Text(
          'Are you sure you want to block $userName? '
          'You will no longer see their sessions or receive messages from them.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              onBlockUser(userId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$userName has been blocked')),
              );
            },
            child: const Text('Block', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}