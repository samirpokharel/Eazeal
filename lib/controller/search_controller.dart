import 'package:eazeal/controller/product_controller.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/product/product_model.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchController extends StateNotifier<ProductState> {
  final Reader _reader;
  SearchController({required Reader reader})
      : _reader = reader,
        super(ProductInitial());

  void searchProduct(String query) async {
    if (state is ProductLoading) return;
    try {
      state = ProductLoading();
      List<Product> products =
          await _reader(categoryProvider).getProducts(query: query);
      if (mounted) {
        state = ProductSuccess(products: products);
      }
    } on CustomException catch (e) {
      state = ProductFailed(exception: e);
    }
  }

  void setInitial() {
    if (mounted) {
      state = ProductInitial();
    }
  }
}
