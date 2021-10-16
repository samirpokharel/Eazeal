// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:eazeal/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String status,
    required String id,
    required List<OrderProduct> products,
    required int orderId,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
abstract class OrderProduct with _$OrderProduct {
  const factory OrderProduct({
    // required String id,
    required String productName,
    required int price,
    required int quantity,
    required String productId,
    required String categoryName,
  }) = _Product;

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);
}
