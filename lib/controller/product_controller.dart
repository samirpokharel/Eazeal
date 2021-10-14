import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/product/product_model.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;
  final Product? singleProduct;
  ProductSuccess({required this.products, this.singleProduct});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductSuccess && listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}

class ProductFailed extends ProductState {
  CustomException exception;
  ProductFailed({required this.exception});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductFailed && other.exception == exception;
  }

  @override
  int get hashCode => exception.hashCode;
}

class ProductController extends StateNotifier<ProductState> {
  final Reader _reader;
  ProductController({required Reader reader})
      : _reader = reader,
        super(ProductInitial());

  void getProduct(String categoryName) async {
    if (state is ProductLoading) return;
    try {
      state = ProductLoading();
      List<Product> products =
          await _reader(categoryProvider).getProducts(query: categoryName);
      if (mounted) {
        state = ProductSuccess(products: products);
      }
    } on CustomException catch (e) {
      state = ProductFailed(exception: e);
    }
  }

  void getSingleProduct(String productId, String categoryName) async {
    if (state is ProductLoading) return;
    try {
      state = ProductLoading();
      List<Product> products = await _reader(categoryProvider).getProducts(
        query: "single-product/$categoryName/$productId",
      );
      if (mounted) {
        state = ProductSuccess(
          singleProduct: products[0],
          products: (state as ProductSuccess).products,
        );
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
