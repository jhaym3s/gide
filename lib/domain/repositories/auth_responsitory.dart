// Project imports:
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/forget_password_resp.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/domain/model_response/signup_response/signup_resp/signup_resp.dart';
import 'package:gide/features/authentication/model/forget_password.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/model/reset_password_model.dart';
import 'package:gide/features/authentication/model/signup_model.dart';
import 'package:gide/features/authentication/model/verify_otp_model.dart';

abstract class AuthRepo {
  Future<BaseResponse<LoginResponse>> login(LoginModel loginModel);
  Future<BaseResponse<SignupResp>> signUp(SignupModel signupModel);
  Future<BaseResponse> verifyOTP(VerifyOtpModel verifyOtpModel);
  Future<BaseResponse> resetPassword(ResetPasswordModel resetPasswordModel);
  Future<BaseResponse<ForgetPasswordResp>> forgetPassword(
      ForgetPasswordModel forgetPassword);
  Future<BaseResponse<List<CategoryResp>>> getCategory();
}
