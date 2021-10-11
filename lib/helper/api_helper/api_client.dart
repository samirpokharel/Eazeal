import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/helper/api_helper/dio_connectivity_request_retryer.dart';
import 'package:eazeal/helper/api_helper/request_intercreptor.dart';
import 'package:flutter/widgets.dart';

class ApiClient {
  final Dio _dio;
  static const String _baseUrl = "https://easy-stationary.herokuapp.com/api/v1";
  static BaseOptions baseOptions = BaseOptions(baseUrl: _baseUrl);

  ApiClient({Dio? dio}) : _dio = dio ?? Dio(baseOptions) {
    _dio.interceptors.add(
      RequestInterceptor(
        dioConnectivityRequestRetrier: DioConnectivityRequestRetrier(
          connectivity: Connectivity(),
          dio: _dio,
        ),
      ),
    );
  }
  Dio get request => _dio;
}
