import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/main.dart';
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
  num _totalPrice = 0;
  num get totalPrice => _totalPrice;

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
    _totalPrice = subTotal();
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
    _totalPrice = subTotal();

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
    _totalPrice = subTotal();

    notifyListeners();
  }

  void increementQuantity(Cart cart) {
    int index = _carts.indexOf(cart);
    if (_carts[index].itemQuantity <= _carts[index].quantity) {
      cart = _carts[index].copyWith(
        itemQuantity: _carts[index].itemQuantity + 1,
      );
      _carts[index] = cart;
    }
    _totalPrice = subTotal();

    notifyListeners();
  }

  void decrementQuantity(Cart cart) {
    int index = _carts.indexOf(cart);
    if (_carts[index].itemQuantity > 1) {
      cart = _carts[index].copyWith(
        itemQuantity: _carts[index].itemQuantity - 1,
      );
      _carts[index] = cart;
    }
    _totalPrice = subTotal();

    notifyListeners();
  }

  num subTotal() {
    num total = 0;
    for (var e in _carts) {
      total += e.itemQuantity * e.price;
    }
    return total;
  }
}
