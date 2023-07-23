class CartListModel {
  int? statusCode;
  List<MyCart>? myCart;
  int? numberOfItems;

  CartListModel({this.statusCode, this.myCart, this.numberOfItems});

  CartListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['my_cart'] != null) {
      myCart = <MyCart>[];
      json['my_cart'].forEach((v) {
        myCart!.add(new MyCart.fromJson(v));
      });
    }
    numberOfItems = json['number_of_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.myCart != null) {
      data['my_cart'] = this.myCart!.map((v) => v.toJson()).toList();
    }
    data['number_of_items'] = this.numberOfItems;
    return data;
  }
}

class MyCart {
  int? id;
  int? user;
  int? variations;
  int? product;
  Null? cart;
  int? quantity;
  bool? isActive;

  MyCart(
      {this.id,
      this.user,
      this.variations,
      this.product,
      this.cart,
      this.quantity,
      this.isActive});

  MyCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    variations = json['variations'];
    product = json['product'];
    cart = json['cart'];
    quantity = json['quantity'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['variations'] = this.variations;
    data['product'] = this.product;
    data['cart'] = this.cart;
    data['quantity'] = this.quantity;
    data['is_active'] = this.isActive;
    return data;
  }
}