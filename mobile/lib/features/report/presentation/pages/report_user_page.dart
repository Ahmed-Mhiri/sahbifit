import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_cubit.dart';
import 'report_form.dart';
import 'report_state.dart';
// Assuming a dependency injection setup (e.g., get_it)
// import 'package:your_app/injection_container.dart';

class ReportUserPage extends StatelessWidget {
  final String reportedUserId;
  final String? sessionId;

  const ReportUserPage({
    super.key,
    required this.reportedUserId,
    this.sessionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report User'),
      ),
      body: BlocProvider(
        // create: (context) => sl<ReportCubit>(), // Using service locator
        create: (context) => ReportCubit(createReport: /* Provide usecase here */), // Manual provision
        child: BlocListener<ReportCubit, ReportState>(
          listener: (context, state) {
            if (state is ReportSuccess) {
              // Show success message and navigate back
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Report submitted successfully')),
              );
              Navigator.of(context).pop();
            } else if (state is ReportFailure) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ReportForm(
              reportedUserId: reportedUserId,
              sessionId: sessionId,
            ),
          ),
        ),
      ),
    );
  }
}