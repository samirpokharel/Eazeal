import 'package:eazeal/models/order/order_model.dart';

abstract class BaseOrderRepository {
  Future<List<Order>> getUserOrder({
    String? page,
    String? limit,
    String? sort,
    String? filter,
  });
  Future<Order> cancelOrder({required String orderId});
  Future<Order> placeAnOrder({required Map<String, dynamic> product});
}
