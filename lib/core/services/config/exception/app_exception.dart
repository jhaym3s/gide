// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/core/services/config/response/base_response.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (DioExceptionType.connectionError == e.type) {
      return BaseResponse(
          statusCode: 99,
          data: data,
          message: 'No Internet Connection',
          status: false,
          returnStatus: 'Informational response');
    } else if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return BaseResponse(
            statusCode: e.response!.statusCode!,
            message: "A server error occurred",
            data: data,
            status: false,
            returnStatus: 'Server Error');
      }
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(BaseResponse.fromMap(e.response?.data));
        return BaseResponse.fromMap(e.response?.data);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          statusCode: e.response!.statusCode,
          message: e.response?.data,
          data: data,
          status: false,
        );
      }
    }
    return BaseResponse(
      statusCode: e.response?.statusCode,
      data: data,
      status: false,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return 'Connection Time Out';
    } else if (DioExceptionType.unknown == error) {
      return 'Please check your internet connection';
    }
    return "A server error occurred";
  }
}
