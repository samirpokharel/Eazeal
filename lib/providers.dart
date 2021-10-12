import 'package:dio/dio.dart';
import 'package:eazeal/controller/auth_controller.dart';
import 'package:eazeal/controller/bottom_nab_bar_controller.dart';
import 'package:eazeal/helper/api_helper/api_client.dart';
import 'package:eazeal/repositories/repositories.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './services/services.dart';

final navigationProvider = Provider<NavigationServices>((ref) {
  return NavigationServices();
});

final apiClientProvider = Provider<Dio>((ref) {
  return ApiClient().request;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(reader: ref.read);
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref.read),
);

final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarController, BottomNavItem>((ref) {
  return BottomNavBarController();
});
