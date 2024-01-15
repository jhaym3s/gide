// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<LoginResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<LoginResponse>.fromJson(
      _result.data!,
      (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<SignupResp>> signup(SignupModel signupModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signupModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<SignupResp>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/signup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<SignupResp>.fromJson(
      _result.data!,
      (json) => SignupResp.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<ForgetPasswordResp>> forgetPassword(
      ForgetPasswordModel forgetPassword) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgetPassword.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ForgetPasswordResp>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/forgot-password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<ForgetPasswordResp>.fromJson(
      _result.data!,
      (json) => ForgetPasswordResp.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> veriftOTP(VerifyOtpModel verifyOtpModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyOtpModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/verify-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> resetPassword(
      ResetPasswordModel resetPasswordModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(resetPasswordModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<BaseResponse<List<CategoryResp>>> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<CategoryResp>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<List<CategoryResp>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CategoryResp>(
                  (i) => CategoryResp.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<BaseResponse<Profile>> updatePhoneNumber(
      PhoneNumerModel phoneNumerModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(phoneNumerModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<Profile>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<Profile>.fromJson(
      _result.data!,
      (json) => Profile.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<Profile>> getProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<Profile>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<Profile>.fromJson(
      _result.data!,
      (json) => Profile.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> changePass(
      ChangePasswordModel changePasswordModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(changePasswordModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/profile/change-password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<BaseResponse<InstructorResp>> becomeAnInstructor(
      BecomeInstructorModel becomeInstructorModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(becomeInstructorModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<InstructorResp>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/profile/instructor',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<InstructorResp>.fromJson(
      _result.data!,
      (json) => InstructorResp.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<AllCoursesModel>> getAllCourses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<AllCoursesModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/courses',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<AllCoursesModel>.fromJson(
      _result.data!,
      (json) => AllCoursesModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<SingleCourseModel>> getSingleCourse({String? id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<SingleCourseModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/courses/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<SingleCourseModel>.fromJson(
      _result.data!,
      (json) => SingleCourseModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<EnrollmentModel>> getEnrollment() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<EnrollmentModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/enrollments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<EnrollmentModel>.fromJson(
      _result.data!,
      (json) => EnrollmentModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<CreateEnrollmentResp>> createEnrollment(
      CreateEnrollment createEnrollment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createEnrollment.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<CreateEnrollmentResp>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/enrollments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<CreateEnrollmentResp>.fromJson(
      _result.data!,
      (json) => CreateEnrollmentResp.fromJson(json as Map<String, dynamic>),
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
