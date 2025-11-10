// In your service_locator.dart file, add these registrations:

import 'package:cloud_firestore/cloud_firestore.dart';
// ... import all the new chat files

void init() {
  // ... your existing registrations (sl, sl<Dio>(), etc.)

  // --- ADD CHAT FEATURE ---

  // External (Firebase)
  // Register the Firestore instance
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Data
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));

  // Domain (Use Cases)
  sl.registerLazySingleton(() => GetChatStream(sl()));
  sl.registerLazySingleton(() => SendMessage(sl()));

  // Presentation (Cubit)
  // We need to pass the `User` at runtime, so we register a factory
  // that accepts a parameter.
  sl.registerFactoryParam<ChatCubit, User, void>(
    (currentUser, _) => ChatCubit(
      getChatStream: sl(),
      sendMessage: sl(),
      currentUser: currentUser,
    ),
  );

  // ... other feature registrations
}