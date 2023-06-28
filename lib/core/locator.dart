import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/state/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerLazySingleton<BlesketApi>(() => BlesketApi());
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
}
