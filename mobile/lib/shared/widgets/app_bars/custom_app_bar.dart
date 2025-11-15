import 'package:flutter/material.dart';
import 'package:sahbifit/core/config/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      leading: showBackButton
          ? (leading ??
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              ))
          : null,
      actions: actions,
      backgroundColor: AppTheme.cleanWhite,
      foregroundColor: AppTheme.darkGray,
      elevation: 0,
      centerTitle: false,
    );
  }
}

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;

  const TransparentAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: AppTheme.darkGray,
      elevation: 0,
    );
  }
}