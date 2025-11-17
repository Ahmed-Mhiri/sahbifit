import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

// These imports are CRITICAL for the generator to find your classes
// The "unused import" warnings are normal and can be ignored
import '../../app/bloc/app_bloc.dart';
import '../../core/services/secure_storage_service.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await $initGetIt(getIt);
}