import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/user/domain/usecases/block_user.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';
import 'package:go_router/go_router.dart';


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
    // 1. Show Confirmation Dialog
    final bool? didConfirm = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: 'Block ${widget.userName}?',
        message:
            'Are you sure you want to block this user? You will no longer see their sessions, and they will not see yours.',
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
            content: Text('${widget.userName} has been blocked.'),
            backgroundColor: AppTheme.successGreen,
          ),
        );
        // Pop back from the profile
        context.pop();

      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to block user: $e'),
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
      child: TextButton(
        onPressed: _isLoading ? null : _handleBlock,
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.primaryRed,
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppTheme.primaryRed,
                ),
              )
            : Text('Block ${widget.userName}'),
      ),
    );
  }
}
