// lib/shared_widgets/custom_scaffold.dart

import 'package:flutter/material.dart';
import '../core/config/app_theme.dart';
import '../core/utils/theme_utils.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showAppBar;
  final bool showBottomNavBar;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Widget? drawer;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomSheet;
  final Widget? probationBanner;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.showAppBar = true,
    this.showBottomNavBar = false,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
    this.bottomSheet,
    this.probationBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppTheme.backgroundWhite,
      appBar: showAppBar
          ? AppBar(
              title: title != null
                  ? Text(
                      title!,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  : null,
              actions: actions,
              backgroundColor: AppTheme.backgroundWhite,
              elevation: 0,
              scrolledUnderElevation: 0.5,
              iconTheme: const IconThemeData(color: AppTheme.primaryDarkGray),
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            if (probationBanner != null) ...[
              probationBanner!,
              const SizedBox(height: ThemeUtils.smallPadding),
            ],
            Expanded(child: body),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: showBottomNavBar ? bottomNavigationBar : null,
      drawer: drawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomSheet: bottomSheet,
    );
  }
}