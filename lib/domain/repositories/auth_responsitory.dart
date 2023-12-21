import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/features/authentication/model/login_model.dart';

abstract class AuthRepo {
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel);
}
