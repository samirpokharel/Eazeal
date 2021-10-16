import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/cart_controller.dart';
import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:riverpod/riverpod.dart';

class PlaceOrder extends StatelessWidget {
  final List<Cart> carts;
  const PlaceOrder({Key? key, required this.carts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = context.read(cartControllerNotifierProvider);
    final user = (context.read(userControllerProvider) as UserSuccess).user;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Place Order"),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Items in your cart",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("SN")),
                    DataColumn(label: Text("Product Name")),
                    DataColumn(label: Text("Prize")),
                    DataColumn(label: Text("Quantity")),
                  ],
                  columnSpacing: 30,
                  rows: carts.asMap().entries.map(
                    (entry) {
                      int index = entry.key + 1;
                      Cart value = entry.value;

                      return DataRow(
                        cells: [
                          DataCell(Text(index.toString())),
                          DataCell(Text(value.productName)),
                          DataCell(Text(value.price.toString())),
                          DataCell(Text(value.itemQuantity.toString())),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
              const Divider(),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(
                      context,
                      "Total Amount: ",
                      "${cartController.totalPrice}",
                    ),
                    const SizedBox(height: 10),
                    _buildText(
                      context,
                      "Name: ",
                      "${user.firstName} + ${user.lastName}",
                    ),
                    const SizedBox(height: 10),
                    _buildText(
                      context,
                      "Phone Number: ",
                      "+977 ${user.phoneNumber}",
                    ),
                    const SizedBox(height: 10),
                    _buildText(
                      context,
                      "Shipping address: ",
                      user.fullAddress,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              Text(
                "* Home delivery",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 10),
              Text(
                "* Cash On Delivery",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 10),
              Text(
                "* 5 days easy returns",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 30),
              AuthButton(
                text: "Conform Order",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildText(BuildContext context, String key, String value) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: Theme.of(context).textTheme.subtitle1,
        children: [
          TextSpan(text: key),
          TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: primaryColor),
            text: value,
          ),
        ],
      ),
    );
  }
}
