// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

// Project imports:
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/upload_file_resp.dart';

class ImagePartConverter extends Converter<File, MultipartFile> {
  @override
  MultipartFile convert(File file) {
    return MultipartFile.fromFileSync(
      file.path,
      filename: file.path.split('/').last,
      contentType: MediaType('image', 'png'), // Specific MIME type
    );
  }
}

class UploadFileApiServices {
  Future<BaseResponse<UploadFileResp>> uploadFiles(
      File file, dio, String baseUrl) async {
    debugLog('In the custom class for uploading only files');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
      'file',
      MultipartFile.fromFileSync(file.path,
          filename: file.path.split(Platform.pathSeparator).last,
          contentType: MediaType('image', 'png')),
    ));
    final _result = await dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<UploadFileResp>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              dio.options,
              '/media/upload',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<UploadFileResp>.fromJson(
      _result.data!,
      (json) => UploadFileResp.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
