import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazeal/controller/cart_controller.dart';
import 'package:eazeal/controller/product_controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  static const String routeName = "/productDetail";
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    Future.delayed(Duration.zero).whenComplete(() {
      // context.read(productControllerProvider.notifier).getSingleProduct(
      //       widget.product.productId,
      //       widget.product.categoryName,
      //     );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context
                    .read(wishiListProvider.notifier)
                    .addToWishList(widget.product);
              },
              icon: Icon(
                Icons.favorite,
                color: context
                        .read(wishiListProvider.notifier)
                        .isInWishlist(widget.product)
                    ? Colors.red
                    : Colors.grey[300],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: ProviderListener(
            provider: cartControllerNotifierProvider,
            onChange: (context, CartControllerNotifier state) {
              if (state.cartStatus == CartStatus.failed &&
                  state.errorMessage.contains("productAlreadyExists")) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
              if (state.cartStatus == CartStatus.success &&
                  state.addedToCartMessage.length > 2) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.addedToCartMessage)),
                );
              }
            },
            child: Consumer(
              builder: (context, watch, child) {
                final cartController =
                    watch(cartControllerNotifierProvider.notifier);
                final cartState = watch(cartControllerNotifierProvider);

                final productState = watch(productControllerProvider);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (productState is ProductLoading)
                      const LinearProgressIndicator(),
                    BuildCarouselSlider(images: widget.product.imageUrl),
                    // const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.product.categoryName,
                                style: theme.headline2,
                              ),
                              const Spacer(),
                              Text(
                                "Rs. ${widget.product.price.toString()}",
                                style: theme.headline2?.copyWith(
                                  color: const Color(0xffFFC531),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                child: const Text("+"),
                              ),
                              const SizedBox(width: 15),
                              Text("0"),
                              const SizedBox(width: 15),
                              OutlinedButton(
                                onPressed: () {},
                                child: const Text("-"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          AuthButton(
                            text: "Add To Cart",
                            buttonStatus:
                                cartState.cartStatus == CartStatus.loading
                                    ? ButtonStatus.busy
                                    : ButtonStatus.idle,
                            color: const Color(0xffFFC531),
                            onPressed: () {
                              cartController.addToCart(
                                widget.product.productId,
                                widget.product.categoryName,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BuildCarouselSlider extends StatelessWidget {
  final List<dynamic> images;

  const BuildCarouselSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        // shrinkWrap: true,
        // primary: false,
        scrollDirection: Axis.horizontal,
        children: images
            .map(
              (image) => Container(
                color: Colors.pink,
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(image, fit: BoxFit.cover),
              ),
            )
            .toList(),
      ),
    );
  }
}
