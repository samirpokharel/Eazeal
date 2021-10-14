import 'package:eazeal/models/models.dart';

abstract class BaseCartRepository {
  Future<List<Cart>> getShoppingCart();
  Future<List<Cart>> addToCart({
    required String productId,
    required String categoryName,
  });
  Future<void> deleteForcart({required String productId});
}
