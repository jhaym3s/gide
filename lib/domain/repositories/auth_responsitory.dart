import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/domain/model_response/signup_response/signup_resp/signup_resp.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/model/signup_model.dart';

abstract class AuthRepo {
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel);
  Future<BaseResponse<SignupResp>> signUp(SignupModel signupModel);
  Future<BaseResponse<List<CategoryResp>>> getCategory();
}
