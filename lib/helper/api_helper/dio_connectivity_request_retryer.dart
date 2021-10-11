import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  const DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  Future<Response?> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        streamSubscription?.cancel();
        responseCompleter.complete(
          dio.request(
            requestOptions.path,
            cancelToken: requestOptions.cancelToken,
            data: requestOptions.data,
            onReceiveProgress: requestOptions.onReceiveProgress,
            onSendProgress: requestOptions.onSendProgress,
            queryParameters: requestOptions.queryParameters,
            options: Options(
              contentType: requestOptions.contentType,
              extra: requestOptions.extra,
              followRedirects: requestOptions.followRedirects,
              headers: requestOptions.headers,
              listFormat: requestOptions.listFormat,
              maxRedirects: requestOptions.maxRedirects,
              method: requestOptions.method,
              receiveDataWhenStatusError:
                  requestOptions.receiveDataWhenStatusError,
              receiveTimeout: requestOptions.receiveTimeout,
              requestEncoder: requestOptions.requestEncoder,
              responseDecoder: requestOptions.responseDecoder,
              responseType: requestOptions.responseType,
              sendTimeout: requestOptions.sendTimeout,
              validateStatus: requestOptions.validateStatus,
            ),
          ),
        );
      }
    });
    return responseCompleter.future;
  }
}
