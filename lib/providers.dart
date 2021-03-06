import 'package:dio/dio.dart';
import 'package:eazeal/controller/cart_controller.dart';
import 'package:eazeal/controller/order_controller.dart';
import 'package:eazeal/controller/token_controller.dart';
import 'package:eazeal/controller/wishlists_controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/repositories/order/order_repository.dart';
import 'package:eazeal/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/controller.dart';
import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/repositories/repositories.dart';
import 'package:eazeal/screens/screens.dart';

final navigationProvider = Provider<NavigationServices>((ref) {
  return NavigationServices();
});

final apiClientProvider = Provider<Dio>((ref) {
  return ApiClient().request;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(reader: ref.read);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepository(reader: ref.read);
});

final categoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(reader: ref.read);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(reader: ref.read);
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(reader: ref.read);
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref.read),
);

final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarController, BottomNavItem>((ref) {
  return BottomNavBarController();
});

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, CategoryState>((ref) {
  return CategoryController(reader: ref.read)..getAllCategory();
});

final productControllerProvider =
    StateNotifierProvider<ProductController, ProductState>((ref) {
  return ProductController(reader: ref.read)..getProduct("All");
});

final searchControllerProvider =
    StateNotifierProvider<SearchController, ProductState>((ref) {
  return SearchController(reader: ref.read);
});

final categoryChipProvider =
    StateNotifierProvider<CategoryChipController, String>((ref) {
  return CategoryChipController();
});

final userControllerProvider =
    StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(reader: ref.read);
});

// final cartControllerProvider =
//     StateNotifierProvider<CartController, CartState>((ref) {
//   return CartController(reader: ref.read)..getShoppingCartItems();
// });

final cartControllerNotifierProvider =
    ChangeNotifierProvider<CartControllerNotifier>((ref) {
  return CartControllerNotifier(reader: ref.read);
});

final wishiListProvider = ChangeNotifierProvider<MywishListNotifier>((ref) {
  return MywishListNotifier()..getWishlist();
});

final tokenNotifier = ChangeNotifierProvider<TokenNotifier>((ref) {
  return TokenNotifier(reader: ref.read);
});

final orderNotifier = ChangeNotifierProvider<OrderController>((ref) {
  return OrderController(reader: ref.read)..getUserOrder();
});
