import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'Sessions.freezed.dart';
part 'Sessions.g.dart';

@freezed
class Sessions with _$Sessions {
	const factory Sessions({
0? 0,
	}) = _Sessions;

	factory Sessions.fromJson(Map<String, dynamic> json) => _$SessionsFromJson(json);
}

@freezed
class 0 with _$0 {
	const factory 0({
int? id,
DateTime? created_at,
String? title,
String? description,
DateTime? session_date,
String? end_time,
String? start_time,
String? uuid,
int? is_active,
List<Product>? product,
	}) = _0;

	factory 0.fromJson(Map<String, dynamic> json) => _$0FromJson(json);
}

@freezed
class Product with _$Product {
	const factory Product({
int? id,
int? product_id,
int? aution_price,
int? is_active,
DateTime? created_at,
int? variation_id,
int? session_id,
	}) = _Product;

	factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}