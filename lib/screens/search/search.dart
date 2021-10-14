import 'package:eazeal/config/configs.dart';
import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:eazeal/widget/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchTerm = "*";

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.refresh(searchControllerProvider);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            child: SearchBar(
              onSearch: (String term) {
                if (term.isNotEmpty) {
                  context
                      .read(searchControllerProvider.notifier)
                      .searchProduct("search/$term");

                  setState(() {
                    searchTerm = term;
                  });
                }
              },
            ),
            preferredSize: const Size.fromHeight(90),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Consumer(
                builder: (context, watch, child) {
                  final productState = watch(searchControllerProvider);
                  if (productState is ProductSuccess) {
                    if ((watch(searchControllerProvider) as ProductSuccess)
                        .products
                        .isEmpty) {
                      return ErrorWidet(
                        message:
                            "product not found for '$searchTerm', please refresh..",
                        wentWrongMessage: "No Product Found!",
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Search Result for "$searchTerm"'),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: (watch(searchControllerProvider)
                                  as ProductSuccess)
                              .products
                              .length,
                          itemBuilder: (context, index) {
                            List<Product> products =
                                (watch(searchControllerProvider)
                                        as ProductSuccess)
                                    .products;
                            return ListProductCard(
                              product: products[index],
                            );
                          },
                        ),
                      ],
                    );
                  } else if (productState is ProductFailed) {
                    return const ErrorWidet(
                      message: "something went wrong please try again",
                      wentWrongMessage: "Oops Were ware unable to laad",
                    );
                  } else if (productState is ProductInitial) {
                    return const ErrorWidet(
                      message: "No Data ! you have not search any thing.",
                      wentWrongMessage: "Please search",
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListProductCard extends StatelessWidget {
  final Product product;
  const ListProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 20),
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
                  image: NetworkImage(product.imageUrl[0]),
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
                        "Rs ${product.price}",
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
                  product.productName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, size: 20, color: Color(0xffFFC531)),
                    Text("(${product.totalRatings})")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
