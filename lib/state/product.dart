import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/core/locator.dart';
import 'package:bleslive/models/products/products.dart';
import 'package:bleslive/models/session/session.dart';
import 'package:bleslive/state/productendpoints.dart';
import 'package:bleslive/state/socket.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductController extends ChangeNotifier {
  BlesketApi _blesketApi = locator.get<BlesketApi>();
  Api _api = locator.get<Api>();

  bool _addtoCartBusy = false;
  bool get addtoCartBusy => _addtoCartBusy;

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

   Future addToCartProduct({required Products? productItem}) async {
    logger.i(productItem);
    logger.i({
      "quantity": 1,
      "product": productItem?.id,
      "variations": productItem?.variation?.first.id,
      "is_active": true
    });
    _addtoCartBusy = true;
    notifyListeners();
    return await _blesketApi
        .post(
          isAuhtenticated: true,
            endpoint: ProductEndPoints.addToCart,
            params: {
              "quantity": 1,
              "product": productItem?.id,
              "variations": productItem?.variation?.first.id,
              "is_active": true
            }, )
        .then((value) {
      logger.i("---add to Cart ${value}"); 
      // _productLists = ProductLists.fromJson(value.data);
      _addtoCartBusy = false;
      notifyListeners();

      return true;
    }).catchError((onError) {
      logger.i("alot 500 ${onError}");
      _addtoCartBusy = false;
      notifyListeners();
      return false;
    });
  }






  void getSessions({required BuildContext context}) async {
    await _api.get(endpoint: 'session/active', params: {}).then((value) {
      logger.i(value);
      _session = Session.fromJson(value.data[0]);
       context.read<SocketApi>().init( );
    });
  }
}
