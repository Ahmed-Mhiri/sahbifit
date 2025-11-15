import 'package:flutter/material.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/app/view/app_view.dart';
import 'package:sahbifit/features/verification/presentation/cubit/verification_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sahbifit/core/config/app_router.dart'; // <-- 1. IMPORT NEW ROUTER

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();

  // 2. Create the AppBloc *first*
  final appBloc = getIt<AppBloc>()
    ..add(const AppEvent.checkAuthStatus());

  // 3. Create the AppRouter and pass the bloc to it
  final appRouter = AppRouter(appBloc);

  runApp(
    MultiBlocProvider(
      providers: [
        // 4. Provide the *same instance* of AppBloc
        BlocProvider.value(value: appBloc),
        BlocProvider(
          create: (context) => getIt<VerificationCubit>()
            ..fetchStatus(),
        ),
      ],
      // 5. Pass the generated GoRouter instance to AppView
      child: AppView(router: appRouter.router),
    ),
  );
}