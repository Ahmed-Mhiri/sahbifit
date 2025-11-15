import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:sahbifit/features/report/presentation/cubit/report_cubit.dart';
import 'package:sahbifit/features/report/presentation/widgets/report_form.dart';
import 'package:sahbifit/shared/widgets/app_bars/custom_app_bar.dart';
import 'package:sahbifit/shared/widgets/dialogs/custom_dialogs.dart';


class ReportUserPage extends StatelessWidget {
  /// The unique ID of the user being reported.
  final String reportedUserId;

  /// The session ID, if the report is related to a specific session.
  final String? sessionId;

  const ReportUserPage({
    super.key,
    required this.reportedUserId,
    this.sessionId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ReportCubit>(),
      child: BlocListener<ReportCubit, ReportState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (_) {
              // Show a success bottom sheet and then navigate back
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                builder: (ctx) => InfoBottomSheet(
                  title: 'Report Submitted',
                  message:
                      'Thank you for helping keep our community safe. We will review your report shortly.',
                  buttonText: 'Got It',
                  onButtonPressed: () {
                    // Pop the bottom sheet
                    Navigator.of(ctx).pop();
                    // Pop the ReportUserPage
                    context.router.pop();
                  },
                ),
              );
            },
            error: (errorState) {
              // Show an error snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorState.message),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
          );
        },
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Report User'),
          body: BlocBuilder<ReportCubit, ReportState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return ReportForm(
                isLoading: isLoading,
                onSubmit: (String reason) {
                  // Dispatch the event to the cubit
                  context.read<ReportCubit>().submitReport(
                        reportedUserId: reportedUserId,
                        reason: reason,
                        sessionId: sessionId,
                      );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
