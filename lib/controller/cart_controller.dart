import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  String successMessage;
  List<Cart> carts;
  CartSuccess({required this.carts, required this.successMessage});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartSuccess &&
        other.successMessage == successMessage &&
        listEquals(other.carts, carts);
  }

  @override
  int get hashCode => successMessage.hashCode ^ carts.hashCode;
}

class CartFailed extends CartState {
  CustomException exception;
  CartFailed({required this.exception});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartFailed && other.exception == exception;
  }

  @override
  int get hashCode => exception.hashCode;
}

class CartController extends StateNotifier<CartState> {
  final Reader _reader;
  CartController({required Reader reader})
      : _reader = reader,
        super(CartInitial());

  void getShoppingCartItems() async {
    if (state is CartLoading) return;
    try {
      state = CartLoading();
      List<Cart> shoppingCarts =
          await _reader(cartRepositoryProvider).getShoppingCart();
      state = CartSuccess(
        carts: shoppingCarts,
        successMessage: "Cart Fetched Successfully",
      );
    } on CustomException catch (e) {
      state = CartFailed(exception: e);
    }
  }

  void addToCart(String productId, String categoryName) async {
    if (state is CartInitial) return;
    try {
      state = CartLoading();
      List<Cart> shoppingCarts = await _reader(cartRepositoryProvider)
          .addToCart(productId: productId, categoryName: categoryName);
      state = CartSuccess(
        carts: shoppingCarts,
        successMessage: "Product Added To Cart Successfully",
      );
    } on CustomException catch (e) {
      state = CartFailed(exception: e);
    }
  }



  void deleteFromCart(String productId) async {
    if (state is CartInitial) return;
    try {
      // state = CartLoading();
      await _reader(cartRepositoryProvider).deleteForcart(productId: productId);

      if (mounted) {
        state = CartSuccess(
          carts: [
            ...(state as CartSuccess)
                .carts
                .where((element) => element.productId != productId),
          ],
          successMessage: "Product Removed From Cart Successfully",
        );
      }
    } on CustomException catch (e) {
      state = CartFailed(exception: e);
    }
  }
}
