import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/models/order/order_model.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OrderControllerStatus { initial, loading, success, failed }

class OrderController extends ChangeNotifier {
  Reader _reader;

  OrderController({required Reader reader}) : _reader = reader;

  OrderControllerStatus _orderControllerStatus = OrderControllerStatus.initial;
  List<Order> _orders = [];
  String _errorMessage = "";
  String _successMessage = "";

  OrderControllerStatus get orderControllerStatus => _orderControllerStatus;
  List<Order> get orders => _orders;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  void getUserOrder({
    String? page,
    String? limit,
    String? sort,
    String? filter,
  }) async {
    if (_orderControllerStatus == OrderControllerStatus.loading) return;
    try {
      _orderControllerStatus = OrderControllerStatus.loading;
      List<Order> orders = await _reader(orderRepositoryProvider).getUserOrder(
        page: page,
        limit: limit,
        sort: sort,
        filter: filter,
      );
      _orders = orders;
      _orderControllerStatus = OrderControllerStatus.success;
    } on CustomException catch (e) {
      _orderControllerStatus = OrderControllerStatus.failed;
      _errorMessage = e.message;
    }
  }

  void placeAnOrder(List<Cart> carts) async {
    if (_orderControllerStatus == OrderControllerStatus.loading) return;
    try {
      List<Map<String, dynamic>> products = carts
          .map((e) => {
                "imageurl": e.imageUrl,
                "productName": e.productName,
                "price": e.price,
                "quantity": e.itemQuantity,
                "productId": e.productId,
                "categoryName": e.categoryName,
              })
          .toList();
      _orderControllerStatus = OrderControllerStatus.loading;
      Order orders = await _reader(orderRepositoryProvider).placeAnOrder(
        product: {"products": products},
      );
      _orderControllerStatus = OrderControllerStatus.success;
      _successMessage = "Order placed successfully. Please refresh";
    } on CustomException catch (e) {
      _orderControllerStatus = OrderControllerStatus.failed;
      _errorMessage = e.message;
    }
  }

  void cancelOrder(String orderId) async {
    if (_orderControllerStatus == OrderControllerStatus.loading) return;
    try {
      _orderControllerStatus = OrderControllerStatus.loading;
      Order orders =
          await _reader(orderRepositoryProvider).cancelOrder(orderId: orderId);
      _orderControllerStatus = OrderControllerStatus.success;
      _successMessage = "Order Cancled successfully. Please refresh";
    } on CustomException catch (e) {
      _orderControllerStatus = OrderControllerStatus.failed;
      _errorMessage = e.message;
    }
  }
}
