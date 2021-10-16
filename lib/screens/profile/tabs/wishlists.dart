import 'package:eazeal/controller/wishlists_controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wishlists extends StatefulWidget {
  const Wishlists({Key? key}) : super(key: key);

  @override
  State<Wishlists> createState() => _WishlistsState();
}

class _WishlistsState extends State<Wishlists> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).whenComplete(() {
      context.read(wishiListProvider.notifier).getWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final wishlistState = watch(wishiListProvider);
        if (wishlistState.wishlistStatus == WishlistStatus.success) {
          return ListView.builder(
            itemCount: wishlistState.products.length,
            itemBuilder: (context, int index) {
              Product product = wishlistState.products[index];
              return Dismissible(
                key: GlobalKey(debugLabel: product.id),
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
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              "Delete",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
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
                    context
                        .read(wishiListProvider.notifier)
                        .removeFromWishlist(product);
                  }
                },
                child: ListProductCard(product: product),
              );
            },
          );
        } else if (wishlistState.wishlistStatus == WishlistStatus.failed) {
          return ErrorWidet(
            message: wishlistState.errorMessage,
            wentWrongMessage: "Something went wrong",
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
