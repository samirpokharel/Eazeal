import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// ignore: implementation_imports
import 'package:rx_shared_preferences/src/interface/extensions.dart';

import 'package:eazeal/config/configs.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await Preferences.preferences.getString("token");
    options.headers["authorization"] = "Bearer $token";
    debugPrint("${options.method}: ${options.uri}");
    super.onRequest(options, handler);
  }
}
