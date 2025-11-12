import 'package:flutter/material.dart';
import 'package:sahbifit/core/di/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/app/view/app_view.dart';
import 'package:sahbifit/features/verification/presentation/cubit/verification_cubit.dart';
import 'package:firebase_core/firebase_core.dart'; // <-- ADD THIS IMPORT

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // <-- ADD THIS LINE
  await configureDependencies();

  runApp(
    // 2. Use MultiBlocProvider to provide all global BLoCs/Cubits
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppBloc>()
            ..add(const AppEvent.checkAuthStatus()),
        ),
        BlocProvider(
          create: (context) => getIt<VerificationCubit>()
            ..fetchStatus(), // <-- 3. Create and fetch status immediately
        ),
      ],
      child: const AppView(), // 4. Your main app widget
    ),
  );
}