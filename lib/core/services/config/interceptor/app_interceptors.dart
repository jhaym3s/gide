// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/repositories/user_repository.dart';

class AppInterceptor extends Interceptor {
  Dio dio;
  UserRepository userRepository;
  AppInterceptor({
    required this.dio,
    required this.userRepository,
  });

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
    try {
      final token = userRepository.getToken();
      if (token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
      }
    } catch (e) {
      debugLog(e);
    }
    if (options.data != null) {
      debugLog('[URL]${options.uri}');
      debugLog("[BODY] ${options.data}");
    }
    return options;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    debugLog(
        'Error raised from interceptors: ${err.message}\n Full Error: ${err.toString()}');
    handler.next(err);
    return err;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugLog("Response: ${response.data}");
    debugLog("Url: ${response.realUri}");
    handler.next(response);
    return response;
  }
}
