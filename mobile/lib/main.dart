import 'package:flutter/material.dart';
import 'package:sahbifit/core/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahbifit/app/bloc/app_bloc.dart';
import 'package:sahbifit/app/view/app_view.dart';
import 'package:sahbifit/features/verification/presentation/cubit/verification_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sahbifit/core/config/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';
import 'package:sahbifit/features/user/presentation/bloc/profile_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment based on build mode
  if (kReleaseMode) {
    await dotenv.load(fileName: "dotenv.prod");
  } else {
    await dotenv.load(fileName: "dotenv");
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  // Create the AppBloc first
  final appBloc = getIt<AppBloc>()
    ..add(const AppEvent.checkAuthStatus());

  // Create the AppRouter and pass the bloc to it
  final appRouter = AppRouter(appBloc);

  runApp(
    MultiBlocProvider(
      providers: [
        // Provide the same instance of AppBloc
        BlocProvider.value(value: appBloc),
        BlocProvider(
          create: (context) => getIt<VerificationCubit>()
            ..fetchStatus(),
        ),
        // This makes ProfileBloc available globally (SessionFeedPage, ChatPage, etc.)
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        ),
      ],
      // Pass the generated GoRouter instance to AppView
      child: AppView(router: appRouter.router),
    ),
  );
}