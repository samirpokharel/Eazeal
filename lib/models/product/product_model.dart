import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required List<dynamic> imageUrl,
    @Default(0) int totalRatings,
    @Default(0) int noOfPeopleRated,
    @Default(0) int noOfPurchases,

    @Default(0) int price,
    @Default({}) Map<String, int> ratings,
    required String id,
    required String categoryName,
    required String productName,
    required String productId,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.empty() => const Product(
        categoryName: "",
        id: "",
        imageUrl: [],
        productName: "",
        productId: "",

      );
}
