import 'package:dio/dio.dart';
import './request_intercepter.dart';

class ApiClient {
  final Dio _dio;
  static const String _baseUrl = "https://easy-stationary.herokuapp.com/api/v1";
  static String? _token;
  static BaseOptions baseOptions = BaseOptions(baseUrl: _baseUrl);

  ApiClient({Dio? dio}) : _dio = dio ?? Dio(baseOptions) {
    _dio.interceptors.add(RequestInterceptor());
  }

  Dio get request => _dio;
}
