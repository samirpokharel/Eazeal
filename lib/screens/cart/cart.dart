import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Cart Screen")),
    );
  }
}
