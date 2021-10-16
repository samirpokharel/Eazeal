import 'package:eazeal/models/category/category_model.dart';
import 'package:eazeal/models/product/product_model.dart';

abstract class BaseCategoryRepository {
  Future<List<Category>> getAllCategories();
  Future<List<Product>> getProducts({
    required String query,
    required int page,
  });
  // Future<Product> getProduct({required String query});
}
