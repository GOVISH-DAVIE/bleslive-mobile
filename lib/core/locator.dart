import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/state/auth.dart';
import 'package:bleslive/state/product.dart';
import 'package:bleslive/state/socket.dart';
import 'package:bleslive/state/utilstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerLazySingleton<BlesketApi>(() => BlesketApi());
  locator.registerFactory<AuthProvider>(() => AuthProvider());
  locator.registerFactory<ProductController>(() => ProductController());
  locator.registerFactory<SocketApi>(() => SocketApi());
  locator.registerFactory<UtilState>(() => UtilState());
}
