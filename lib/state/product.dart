import 'package:bleslive/core/api/api.dart';
import 'package:bleslive/core/locator.dart';
import 'package:bleslive/models/cart/cart.dart';
import 'package:bleslive/models/products/products.dart';
import 'package:bleslive/models/session/session.dart';
import 'package:bleslive/state/productendpoints.dart';
import 'package:bleslive/state/socket.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends ChangeNotifier {
  BlesketApi _blesketApi = locator.get<BlesketApi>();
  Api _api = locator.get<Api>();

  bool _addtoCartBusy = false;
  bool get addtoCartBusy => _addtoCartBusy;

  List<Products> _products = [];
  List<Products> get products => _products;
  Session? _session;
  Session? get session => _session;


  CartListModel? _cartListModel ;
  CartListModel? get cartListModel => _cartListModel ;

  Map<int?, List<MyCart>>? _sortedCart ;
  Map<int?, List<MyCart>>? get sortedCart =>_sortedCart ;
  int _Carttotals = 0;
  int get cartTotals => _Carttotals;

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

  Future addToCartProduct(
      {required Products? productItem, required BuildContext context}) async {
    logger.i(productItem);

    logger.i({
      "quantity": 1,
      "product": productItem?.id,
      "variations": productItem?.variation?.first.id,
      "is_active": true
    });
    _addtoCartBusy = true;
    notifyListeners();
    return await _blesketApi.post(
      isJson: true,
      isAuhtenticated: true,
      endpoint: ProductEndPoints.addToCart,
      params: {
        "quantity": 1,
        "product": productItem?.id,
        "variations": productItem?.variation?.first.id,
        "is_active": true
      },
    ).then((value) {
      logger.i("---add to Cart ${value}");
      // _productLists = ProductLists.fromJson(value.data);
      _addtoCartBusy = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Added  to Cart Successfully")));

      return true;
    }).catchError((onError) {
      logger.i("alot 500 ${onError}");

      _addtoCartBusy = false;
      notifyListeners();
      return false;
    });
  }


getCart(){
  _blesketApi.get(endpoint: ProductEndPoints.cartList)
  .then((value){
    logger.i(value);
    _cartListModel = CartListModel.fromJson(value.data);
     _sortedCart = groupBy(CartListModel.fromJson(value.data).myCart!, (MyCart cart)=>cart.variations);
     int totals = 0;
     _sortedCart?.forEach((key,value){
      var len = value.length;
     
      int? i =  products.where((product) => 
      product.id == value.first.product).first.variation?.where(
        (variation) => variation.id == value.first.product).first.price;
     totals = totals+ (len *i!);
       
     }
      
     );
     _Carttotals = totals;
    logger.i(_sortedCart);
    notifyListeners();
  });

}


  void getSessions({required BuildContext context}) async {
    await _api.get(endpoint: 'session/active', params: {}).then((value) {
      logger.i(value);
      _session = Session.fromJson(value.data[0]);
      context.read<SocketApi>().init();
      context
          .read<SocketApi>()
          .join(session: Session.fromJson(value.data[0]).uuid!);
      notifyListeners();
    });
  }
}
