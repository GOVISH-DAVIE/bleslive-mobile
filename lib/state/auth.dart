import 'package:bleslive/core/api/api_implimentation.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = Api();
  login({
    required String email, required String password
  }) async {
    logger.d(password);
  }
}
