import 'package:dio/dio.dart';
import 'package:eazeal/helper/api_helper/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './utils/utils.dart';
import './services/services.dart';

final navigationProvider = Provider<NavigationServices>((ref) {
  return NavigationServices();
});

final apiClientProvider = Provider<Dio>((ref) {
  return ApiClient().request;
});
