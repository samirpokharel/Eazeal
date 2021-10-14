import 'dart:io';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/category/category_model.dart';
import 'package:eazeal/models/product/product_model.dart';
import 'package:eazeal/providers.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<Category> categories;
  CategorySuccess({required this.categories});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategorySuccess &&
        fd.listEquals(other.categories, categories);
  }

  @override
  int get hashCode => categories.hashCode;
}

class CategoryFailed extends CategoryState {
  CustomException exception;
  CategoryFailed({required this.exception});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryFailed && other.exception == exception;
  }

  @override
  int get hashCode => exception.hashCode;
}

class CategoryController extends StateNotifier<CategoryState> {
  Reader _reader;
  CategoryController({required Reader reader})
      : _reader = reader,
        super(CategoryInitial());

  void getAllCategory() async {
    if (state is CategoryLoading) return;
    try {
      state = CategoryLoading();
      List<Category> categories =
          await _reader(categoryProvider).getAllCategories();
      state = CategorySuccess(categories: categories);
    } on CustomException catch (e) {
      state = CategoryFailed(exception: e);
    }
  }
 

}
