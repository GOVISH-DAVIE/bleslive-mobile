import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/core/locator.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  Future login({password, username}) async {}
}
