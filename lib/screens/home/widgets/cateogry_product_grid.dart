import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/screens/screens.dart';

import 'package:eazeal/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Consumer(
      builder: (context, watch, child) {
        final categoryProduct = watch(productControllerProvider);
        if (categoryProduct is ProductSuccess) {
          if ((watch(productControllerProvider) as ProductSuccess)
              .products
              .isEmpty) {
            return const ErrorWidet(
              message: "No data, please refresh..",
              wentWrongMessage: "No Data Found",
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLanscape ? 4 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2 / 2.2,
            ),
            itemCount: (watch(productControllerProvider) as ProductSuccess)
                .products
                .length,
            itemBuilder: (context, int index) {
              List<Product> product =
                  (watch(productControllerProvider) as ProductSuccess).products;
              return _GridProductItem(product: product[index]);
            },
          );
        } else if (categoryProvider is ProductFailed) {
          return const ErrorWidet(
            message: "please refresh the page",
            wentWrongMessage: "Something went wrong",
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class _GridProductItem extends StatelessWidget {
  final Product product;
  const _GridProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetail.routeName,
        arguments: product,
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product.imageUrl[0]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rs ${product.price}",
                        style: textStyle.headline3?.copyWith(
                          color: primaryColor,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star,
                          size: 20, color: Color(0xffFFC531)),
                      Text("${product.totalRatings}")
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product.productName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
