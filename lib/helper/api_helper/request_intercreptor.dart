import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/helper/api_helper/dio_connectivity_request_retryer.dart';

class RequestInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier _dioConnectivityRequestRetrier;

  RequestInterceptor({
    required DioConnectivityRequestRetrier dioConnectivityRequestRetrier,
  }) : _dioConnectivityRequestRetrier = dioConnectivityRequestRetrier;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      _dioConnectivityRequestRetrier.scheduleRequestRetry(err.requestOptions);
      throw CustomException(message: "No internet");
    }
    if (err.type == DioErrorType.response) {
      throw CustomException(message: err.response!.data["message"]);
    }
    super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
