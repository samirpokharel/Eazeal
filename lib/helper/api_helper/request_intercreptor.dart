import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/api_helper/dio_connectivity_request_retryer.dart';

class RequestInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier _dioConnectivityRequestRetrier;

  RequestInterceptor({
    required DioConnectivityRequestRetrier dioConnectivityRequestRetrier,
  }) : _dioConnectivityRequestRetrier = dioConnectivityRequestRetrier;



  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      try {
        _dioConnectivityRequestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        print(e);
      }
    }
    super.onError(err, handler);
  }



  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
