import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/order/order_model.dart';
import 'package:eazeal/repositories/order/base_order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class OrderRepository extends BaseOrderRepository {
  Reader _reader;
  OrderRepository({required Reader reader}) : _reader = reader;

  @override
  Future<List<Order>> getUserOrder({
    String? page,
    String? limit,
    String? sort,
    String? filter,
  }) async {
    try {
      Map<String, dynamic> query = {};
      if (page != null) query["page"] = page;
      if (limit != null) query["limit"] = limit;
      if (sort != null) query["sort"] = sort;
      if (filter != null) query["filter"] = filter;

      Response response = await _reader(apiClientProvider)
          .get("/orders", queryParameters: query);
      List<Order> orders = List.from(response.data["orders"]
          .map((order) => Order.fromJson(order))
          .toList());
      return orders;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      if (err.error is SocketException) {
        throw CustomException(message: "No Internet Connection");
      }
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Future<Order> cancelOrder({required String orderId}) async {
    try {
      Response response =
          await _reader(apiClientProvider).patch("/orders/$orderId");
      Order order = Order.fromJson(response.data["order"]);
      return order;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      if (err.error is SocketException) {
        throw CustomException(message: "No Internet Connection");
      }
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Future<Order> placeAnOrder({required Map<String, dynamic> product}) async {
    try {
      Response response = await _reader(apiClientProvider)
          .post("/orders", data: json.encode(product));
      Order order = Order.fromJson(response.data["order"]);
      return order;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      if (err.error is SocketException) {
        throw CustomException(message: "No Internet Connection");
      }
      throw CustomException(message: "Something went wrong");
    }
  }
}
