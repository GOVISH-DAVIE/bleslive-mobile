import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/core/locator.dart';
import 'package:bleslive/models/products/products.dart';
import 'package:bleslive/models/session/session.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  BlesketApi _blesketApi = locator.get<BlesketApi>();
  Api _api = locator.get<Api>();

  List<Products> _products = [];
  List<Products> get products => _products;
  Session? _session;
  Session? get session => _session;

  void getProducts() async {
    await _blesketApi.get(endpoint: 'store/all/', params: {}).then((value) {
      logger.i(value);
      // _products = value.data 
      for (var i = 0; i < value.data.length; i++) {
        _products.add(Products.fromJson(value.data[i]));
      }
      notifyListeners();
    });
  }
  void getSessions() async {
    await _api.get(endpoint: 'session/active', params: {}).then((value) {
      logger.i(value);
      _session = Session.fromJson(value.data[0]);
    });
  }
}
