import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/infrastructure/database/database.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection() {
  if (!getIt.isRegistered<AppDatabase>()) {
    getIt.registerLazySingleton<AppDatabase>(() => AppDatabase.instance);
  }

  getIt.init(environment: Environment.prod);
}
