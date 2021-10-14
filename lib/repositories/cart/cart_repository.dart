import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/cart/cart_model.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartRepository extends BaseCartRepository {
  final Reader _reader;
  CartRepository({required Reader reader}) : _reader = reader;

  @override
  Future<List<Cart>> addToCart({
    required String productId,
    required String categoryName,
  }) async {
    try {
      final jsonData = json.encode({
        "productId": productId,
        "categoryName": categoryName,
      });
      Response response = await _reader(apiClientProvider).post(
        "/shopping-cart",
        data: jsonData,
      );
      List<Cart> carts = List.from(
        response.data["shoppingCart"].map((cart) => Cart.fromJson(cart)),
      );
      return carts;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteForcart({required String productId}) async {
    try {
      await _reader(apiClientProvider).delete("/shopping-cart/$productId");
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      rethrow;
    }
  }

  @override
  Future<List<Cart>> getShoppingCart() async {
    print("fetching...");
    try {
      Response response = await _reader(apiClientProvider).get(
        "/shopping-cart",
      );
      List<Cart> carts = List.from(
        response.data["shoppingCart"].map((cart) => Cart.fromJson(cart)),
      );
      return carts;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      rethrow;
    }
  }
}
