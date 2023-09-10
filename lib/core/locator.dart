import 'package:bleslive/state/auth/auth.dart';
import 'package:get_it/get_it.dart';

import 'api/api_implimentation.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerFactory<AuthProvider>(() => AuthProvider());

}