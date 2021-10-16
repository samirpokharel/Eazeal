// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:eazeal/helper/helpers.dart';
// import 'package:eazeal/models/models.dart';
// import 'package:eazeal/providers.dart';

// abstract class CartState {}

// class CartInitial extends CartState {}

// class CartLoading extends CartState {}

// class CartSuccess extends CartState {
//   String successMessage;
//   List<Cart> carts;
//   CartSuccess({required this.carts, required this.successMessage});

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is CartSuccess &&
//         other.successMessage == successMessage &&
//         listEquals(other.carts, carts);
//   }

//   @override
//   int get hashCode => successMessage.hashCode ^ carts.hashCode;
// }

// class CartFailed extends CartState {
//   CustomException exception;
//   CartFailed({required this.exception});

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is CartFailed && other.exception == exception;
//   }

//   @override
//   int get hashCode => exception.hashCode;
// }

// class CartController extends StateNotifier<CartState> {
//   final Reader _reader;
//   CartController({required Reader reader})
//       : _reader = reader,
//         super(CartInitial());

//   void getShoppingCartItems() async {
//     if (state is CartLoading) return;
//     try {
//       state = CartLoading();
//       List<Cart> shoppingCarts =
//           await _reader(cartRepositoryProvider).getShoppingCart();
//       state = CartSuccess(
//         carts: shoppingCarts,
//         successMessage: "Cart Fetched Successfully",
//       );
//     } on CustomException catch (e) {
//       state = CartFailed(exception: e);
//     }
//   }

//   void addToCart(String productId, String categoryName) async {
//     if (state is CartInitial) return;
//     try {
//       state = CartLoading();
//       List<Cart> shoppingCarts = await _reader(cartRepositoryProvider)
//           .addToCart(productId: productId, categoryName: categoryName);
//       state = CartSuccess(
//         carts: shoppingCarts,
//         successMessage: "Product Added To Cart Successfully",
//       );
//     } on CustomException catch (e) {
//       state = CartFailed(exception: e);
//     }
//   }

//   void incrementQuantity(String productId) {
//     print("increment");
//     List<Cart> carts = (state as CartSuccess).carts;
//     Cart cart = carts.firstWhere((element) => element.productId == productId);
//     Cart newCart = cart.copyWith(itemQuantity: cart.itemQuantity + 1);
//     List<Cart> _carts = carts.where((element) => element != cart).toList();

//     state = CartSuccess(carts: [..._carts, newCart], successMessage: "");
//   }

//
// }

// class QuantityUpdateController extends StateNotifier<int> {
//   QuantityUpdateController() : super(0);

//   void increment() {
//     state = state++;
//   }

//   void decrement() {
//     state = state--;
//   }
// }

import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CartStatus { initial, loading, success, failed }

class CartControllerNotifier extends ChangeNotifier {
  final Reader _reader;
  CartControllerNotifier({required Reader reader}) : _reader = reader;

  CartStatus _cartStatus = CartStatus.initial;
  List<Cart> _carts = [];
  String _errorMessage = "";
  String _addedtoCartMessage = "";

  CartStatus get cartStatus => _cartStatus;
  List<Cart> get carts => _carts;
  String get errorMessage => _errorMessage;
  String get addedToCartMessage => _addedtoCartMessage;

  void getAllCart() async {
    if (_cartStatus == CartStatus.loading) return;
    try {
      _cartStatus = CartStatus.loading;
      List<Cart> carts = await _reader(
        cartRepositoryProvider,
      ).getShoppingCart();
      _carts = carts;
      _cartStatus = CartStatus.success;
    } on CustomException catch (e) {
      _cartStatus = CartStatus.failed;
      _errorMessage = e.message;
    }
    notifyListeners();
  }

  void deleteFromCart(String productId) async {
    if (_cartStatus == CartStatus.loading) return;

    try {
      // _cartStatus = CartStatus.loading;

      await _reader(cartRepositoryProvider).deleteForcart(productId: productId);
      _carts.removeWhere((element) => element.productId == productId);
      _cartStatus = CartStatus.success;
    } on CustomException catch (e) {
      _cartStatus = CartStatus.failed;
      _errorMessage = e.message;
    }
    notifyListeners();
  }

  void addToCart(String productId, String categoryName) async {
    if (_cartStatus == CartStatus.loading) return;
    try {
      _cartStatus = CartStatus.loading;
      List<Cart> carts = await _reader(cartRepositoryProvider).addToCart(
        productId: productId,
        categoryName: categoryName,
      );
      _carts = carts;
      _addedtoCartMessage = "Product added to cart successfully";
      _cartStatus = CartStatus.success;
    } on CustomException catch (e) {
      _cartStatus = CartStatus.failed;
      _errorMessage = e.message;
    }
    notifyListeners();
  }

  void increementQuantity(Cart cart) {
    int index = _carts.indexOf(cart);

    cart = _carts[index].copyWith(
      itemQuantity: _carts[index].itemQuantity + 1,
    );
    _carts[index] = cart;
    notifyListeners();
  }

  void decrementQuantity(Cart cart) {
    int index = _carts.indexOf(cart);
    cart = _carts[index].copyWith(
      itemQuantity: _carts[index].itemQuantity - 1,
    );
    _carts[index] = cart;
    notifyListeners();
  }
}
