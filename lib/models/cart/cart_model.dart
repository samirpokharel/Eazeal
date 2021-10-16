// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    required List<String> imageUrl,
    // required String id,
    required int price,
    required String productName,
    required int quantity,
    @Default(1) int itemQuantity,
    required String productId,
    required String categoryName,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
