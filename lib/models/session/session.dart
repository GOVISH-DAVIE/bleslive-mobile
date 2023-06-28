class Session {
  int? id;
  String? createdAt;
  String? title;
  String? description;
  String? sessionDate;
  String? endTime;
  String? startTime;
  String? uuid;
  int? isActive;
  List<Product>? product;

  Session(
      {this.id,
      this.createdAt,
      this.title,
      this.description,
      this.sessionDate,
      this.endTime,
      this.startTime,
      this.uuid,
      this.isActive,
      this.product});

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    title = json['title'];
    description = json['description'];
    sessionDate = json['session_date'];
    endTime = json['end_time'];
    startTime = json['start_time'];
    uuid = json['uuid'];
    isActive = json['is_active'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['session_date'] = this.sessionDate;
    data['end_time'] = this.endTime;
    data['start_time'] = this.startTime;
    data['uuid'] = this.uuid;
    data['is_active'] = this.isActive;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  int? productId;
  int? autionPrice;
  int? isActive;
  String? createdAt;
  int? variationId;
  int? sessionId;

  Product(
      {this.id,
      this.productId,
      this.autionPrice,
      this.isActive,
      this.createdAt,
      this.variationId,
      this.sessionId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    autionPrice = json['aution_price'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    variationId = json['variation_id'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['aution_price'] = this.autionPrice;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['variation_id'] = this.variationId;
    data['session_id'] = this.sessionId;
    return data;
  }
}