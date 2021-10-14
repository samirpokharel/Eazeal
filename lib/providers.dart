import 'package:dio/dio.dart';
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

final categoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(reader: ref.read);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(reader: ref.read);
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
}) ;
