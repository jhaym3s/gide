import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/app_exception.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/core/services/network/rest_client.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/domain/model_response/signup_response/signup_resp/signup_resp.dart';
import 'package:gide/domain/repositories/auth_responsitory.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/model/signup_model.dart';

class AuthImpl extends AuthRepo {
  final RestClient _client;

  AuthImpl(this._client);

  @override
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel) async {
    try {
      final resp = await _client.login(loginModel);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse<SignupResp>> signUp(SignupModel signupModel) async {
    try {
      final resp = await _client.signup(signupModel);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse<CategoryResp>> getCategory() async {
    try {
      final resp = await _client.getCategories();
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }
}

final authRepoProv = Provider((ref) => AuthImpl(ref.read(restClientProvider)));
