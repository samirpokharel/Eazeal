import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazeal/models/models.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  static const String routeName = "/productDetail";
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          BuildCarouselSlider(images: product.imageUrl),
        ],
      ),
    );
  }
}

class BuildCarouselSlider extends StatelessWidget {
  final List<dynamic> images;

  const BuildCarouselSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map((image) => Image.network(image, fit: BoxFit.contain))
          .toList(),
      options: CarouselOptions(
        height: 200,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
