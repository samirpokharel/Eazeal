import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/cart_controller.dart';
import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/cart/place_order.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class CartScreen extends StatefulWidget {
  static const String routeName = "/cartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).whenComplete(() {
      context.read(cartControllerNotifierProvider.notifier).getAllCart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read(cartControllerNotifierProvider.notifier).getAllCart();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          actions: [
            TextButton(
              onPressed: () {
                final products =
                    context.read(cartControllerNotifierProvider).carts;

                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => PlaceOrder(carts: products),
                  ),
                );
              },
              child: const Text(
                "checkout",
                style: TextStyle(fontSize: 16, color: primaryColor),
              ),
            )
          ],
        ),
        body: Consumer(
          builder: (context, watch, child) {
            final cartState = watch(cartControllerNotifierProvider);
            final cartNotifier = watch(cartControllerNotifierProvider.notifier);

            if (cartState.cartStatus == CartStatus.success) {
              debugPrint(cartState.totalPrice.toString());
              if (cartState.carts.isEmpty) {
                return _buildErrorWidget(
                  "your shopping cart is empty",
                  "No Product Found ",
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: cartState.carts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Dismissible(
                        key: GlobalKey(
                            debugLabel: cartState.carts[index].productId),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: const EdgeInsets.all(30),
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text(
                                  "Are you sure you wish to delete this item?",
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.endToStart) {
                            cartNotifier.deleteFromCart(
                              cartState.carts[index].productId,
                            );
                          }
                        },
                        child: ShopingCartListCard(
                          cart: cartState.carts[index],
                        ),
                      ),
                    );
                  },
                );
              }
            } else if (cartState.cartStatus == CartStatus.failed) {
              return _buildErrorWidget(cartState.errorMessage);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  _buildErrorWidget(String message, [String? otpMessage]) {
    return ErrorWidet(
      message: message,
      wentWrongMessage: otpMessage ?? "OOPs something went wrong",
    );
  }
}

class ShopingCartListCard extends StatelessWidget {
  final Cart cart;
  const ShopingCartListCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cart.imageUrl[0]),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Rs ${cart.price}",
                            style: textStyle.headline3?.copyWith(
                              color: primaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite, color: Colors.grey[400]),
                        )
                      ],
                    ),
                    Text(
                      cart.productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read(cartControllerNotifierProvider.notifier)
                                  .increementQuantity(cart);
                            },
                            child: const Text("+"),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(cart.itemQuantity.toString()),
                        const SizedBox(width: 15),
                        SizedBox(
                          height: 20,
                          width: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read(cartControllerNotifierProvider.notifier)
                                  .decrementQuantity(cart);
                            },
                            child: const Text("-"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
