class Products {
  int? id;
  String? productName;
  String? slug;
  String? description;
  String? mobileImage;
  String? originalImage;
  int? category;
  String? createdDate;
  String? modifiedDate;
  List<Variation>? variation;

  Products(
      {this.id,
      this.productName,
      this.slug,
      this.description,
      this.mobileImage,
      this.originalImage,
      this.category,
      this.createdDate,
      this.modifiedDate,
      this.variation});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    slug = json['slug'];
    description = json['description'];
    mobileImage = json['mobile_image'];
    originalImage = json['original_image'];
    category = json['category'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(new Variation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['mobile_image'] = this.mobileImage;
    data['original_image'] = this.originalImage;
    data['category'] = this.category;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    if (this.variation != null) {
      data['variation'] = this.variation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variation {
  int? id;
  int? product;
  String? variationCategory;
  String? variationValue;
  String? isbn;
  int? price;
  int? stock;
  bool? isActive;
  String? createdDate;

  Variation(
      {this.id,
      this.product,
      this.variationCategory,
      this.variationValue,
      this.isbn,
      this.price,
      this.stock,
      this.isActive,
      this.createdDate});

  Variation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    variationCategory = json['variation_category'];
    variationValue = json['variation_value'];
    isbn = json['isbn'];
    price = json['price'];
    stock = json['stock'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['variation_category'] = this.variationCategory;
    data['variation_value'] = this.variationValue;
    data['isbn'] = this.isbn;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    return data;
  }
}