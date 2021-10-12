import 'dart:html';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/product/product_model.dart';
import 'package:eazeal/models/category/category_model.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/repositories/category/base_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryRepository extends BaseCategoryRepository {
  final Reader _reader;

  CategoryRepository({required Reader reader}) : _reader = reader;
  @override
  Future<List<Category>> getAllCategories() async {
    try {
      Response response = await _reader(apiClientProvider).get("/category");
      if (response.statusCode == 200) {
        List<Category> categories = List.from(
          (response.data['categories']).map(
            (cateogory) => Category.fromJson(cateogory as Map<String, dynamic>),
          ),
        );
        return categories;
      } else {
        throw CustomException(message: response.data["message"]);
      }
    } on DioError catch (err) {
      throw CustomException(message: err.response!.data["message"]);
    }
  }

  @override
  Future<List<Product>> getAllCategoryProduct(
      {required String categoryName}) async {
    try {
      Response response =
          await _reader(apiClientProvider).get("/category/$categoryName");
      if (response.statusCode == 200) {
        List<Product> products = List.from(
          (response.data['products']).map(
            (cateogory) => Product.fromJson(cateogory as Map<String, dynamic>),
          ),
        );
        return products;
      } else {
        throw CustomException(message: response.data["message"]);
      }
    } on DioError catch (err) {
      throw CustomException(message: err.response!.data["message"]);
    }
  }
}
