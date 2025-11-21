import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/usecases/block_user.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';

class BlockUserButton extends StatefulWidget {
  final String userId;
  final String userName;

  const BlockUserButton({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  State<BlockUserButton> createState() => _BlockUserButtonState();
}

class _BlockUserButtonState extends State<BlockUserButton> {
  bool _isLoading = false;

  Future<void> _handleBlock() async {
    // 1. Show Confirmation Dialog (Nuclear Warning)
    final bool? didConfirm = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: 'Block ${widget.userName}?',
        message:
            'They will be removed from your feed, and you won\'t be able to join sessions they are in. \n\nThis action cannot be undone from this screen.',
        confirmText: 'Block',
        cancelText: 'Cancel',
        onConfirm: () => Navigator.of(context).pop(true),
      ),
    );

    if (didConfirm != true) return;

    // 2. Perform Block Action
    setState(() => _isLoading = true);
    try {
      await getIt<BlockUser>().call(BlockUserParams(userId: widget.userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.userName} blocked.'),
            backgroundColor: AppTheme.darkGray, 
          ),
        );
        
        // 3. Nuclear Exit: Force user back to previous screen
        // because the profile they are looking at technically "no longer exists" for them
        context.pop(); 
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to block user. Please try again.'),
            backgroundColor: AppTheme.primaryRed,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: _isLoading ? null : _handleBlock,
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.primaryRed,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        icon: _isLoading 
          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
          : const Icon(Icons.block_outlined, size: 20),
        label: Text(_isLoading ? ' Blocking...' : 'Block ${widget.userName}'),
      ),
    );
  }
}