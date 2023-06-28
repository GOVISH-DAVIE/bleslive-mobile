import 'dart:convert';

import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/core/locator.dart';
import 'package:bleslive/models/user/user.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  final BlesketApi _blesketApi = locator.get<BlesketApi>();
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  User? _user; 
  User? get user => _user;


  



  Future login({password, username}) async {
    final prefs = await SharedPreferences.getInstance();

    await _blesketApi.post(endpoint: 'auth/jwt/create/', params:{
      'password':password,
      "email":username
    } ,
    isAuhtenticated: false
    ).then((value){
      logger.i(value);
      prefs.setString('user', jsonEncode(User.fromJson(value.data).toJson() ));
      _isLoggedIn = true;
      notifyListeners();


    });
  }
}
