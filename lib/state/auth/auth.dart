import 'dart:convert';

import 'package:bleslive/core/api/api_implimentation.dart';
import 'package:bleslive/models/login_response/login_response.dart';
import 'package:bleslive/state/auth/auth_endpoints.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = Api();
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  LoginResponse? _user;
  LoginResponse? get user => _user;
  login({required String email, required String password}) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    logger.d(password);
    _isBusy = true;
    notifyListeners();
    await _api
        .post(
      endpoint: AuthEndpoints.login,
      params: {"password": password, "email": email},
      isAuthorized: false,
    )
        .then((value) { 
      LoginResponse _login = LoginResponse.fromJson(value.data);
      _user = _login;
      prefs.setString('user', jsonEncode(_login));
      _isBusy = false;
      notifyListeners();
    }).catchError((onError) {
      logger.e(onError);
      _isBusy = false;
      notifyListeners();
    });
  }
}
