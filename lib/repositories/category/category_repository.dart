import 'dart:io';

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
        return [Category.empty().copyWith(categoryName: "All"), ...categories];
      } else {
        throw CustomException(message: response.data["message"]);
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      rethrow;
    }
  }

  String categoryName(String query) {
    List<String> querys = query.split("/");

    if (query == "All") {
      return "/all-products";
    } else if (querys[0] == "search") {
      return "/all-products/search?q=${querys[1]}";
    } else {
      return "/category/$query";
    }
  }

  @override
  Future<List<Product>> getProducts({
    required String query,
  }) async {
    try {
      String name = categoryName(query);
      Response response = await _reader(apiClientProvider).get(name);

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
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      rethrow;
    }
  }
}
