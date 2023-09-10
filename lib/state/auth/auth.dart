import 'package:bleslive/core/api/api_implimentation.dart';
import 'package:bleslive/state/auth/auth_endpoints.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = Api();
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  login({required String email, required String password}) async {
    logger.d(password);
    _isBusy = true;
    notifyListeners(); 
    await _api.post(
        endpoint: AuthEndpoints.login,
        params: {"password": password, "email": email},
        isAuthorized: false,

        ).then((value) {
          logger.i(value);
        }).
        catchError((onError){
          logger.e(onError);
        })
        ;
  }
}
