import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/cart_controller.dart';
import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
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
      context.read(cartControllerProvider.notifier).getShoppingCartItems();
      // if ((context.read(cartControllerProvider) is! UserSuccess)) {
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read(cartControllerProvider.notifier).getShoppingCartItems();
      },
      child: ProviderListener(
        provider: cartControllerProvider,
        onChange: (context, state) {
          if (state is CartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.successMessage)),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("My Cart"),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "checkout",
                  style: TextStyle(fontSize: 16, color: primaryColor),
                ),
              )
            ],
          ),
          body: Consumer(
            builder: (context, watch, child) {
              final cartState = watch(cartControllerProvider);
              if (cartState is CartSuccess) {
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
                          key: GlobalKey(debugLabel: cartState.carts[index].id),
                          direction: DismissDirection.endToStart,
                          background: Container(color: Colors.red),
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
                              watch(cartControllerProvider.notifier)
                                  .deleteFromCart(
                                cartState.carts[index].productId,
                              );
                            }
                          },
                          child:
                              ShopingCartListCard(cart: cartState.carts[index]),
                        ),
                      );
                    },
                  );
                }
              } else if (cartState is CartFailed) {
                return _buildErrorWidget(cartState.exception.message);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
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
      // onTap: () => Navigator.pushNamed(
      //   context,
      //   ProductDetail.routeName,
      //   arguments: Product.empty().copyWith(
      //     categoryName: cart.categoryName,
      //     imageUrl: cart.imageUrl,
      //     id: cart.id,
      //     productId: cart.productId,
      //     productName: cart.productName,
      //     price: cart.price,
      //   ),
      // ),
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
                            onPressed: () {},
                            child: const Text("+"),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(cart.quantity.toString()),
                        const SizedBox(width: 15),
                        SizedBox(
                          height: 20,
                          width: 40,
                          child: OutlinedButton(
                            onPressed: () {},
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
