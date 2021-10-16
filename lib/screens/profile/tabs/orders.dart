import 'package:eazeal/controller/order_controller.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    Future.delayed(Duration.zero).whenComplete(() {
      context.read(orderNotifier).getUserOrder();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final orderController = watch(orderNotifier);
        if (orderController.orderControllerStatus ==
            OrderControllerStatus.success) {
          return RefreshIndicator(
            onRefresh: () async {
              orderController.getUserOrder();
            },
            child: ListView.builder(
              itemCount: orderController.orders.length,
              itemBuilder: (context, int index) {
                return Container(
                  color: Colors.pink,
                  height: 300,
                );
              },
            ),
          );
        } else if (orderController.orderControllerStatus ==
            OrderControllerStatus.failed) {
          return ErrorWidet(
            message: orderController.errorMessage,
            wentWrongMessage: "Oops something went wrong",
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
