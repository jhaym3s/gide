// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/forget_password_resp.dart';
import 'package:gide/domain/model_response/instructor_resp.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/upload_file_resp.dart';
import 'package:gide/features/dashboard/profile/become_instructor_model.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/domain/model_response/signup_response/signup_resp/signup_resp.dart';
import 'package:gide/features/authentication/model/forget_password.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/model/reset_password_model.dart';
import 'package:gide/features/authentication/model/signup_model.dart';
import 'package:gide/features/authentication/model/verify_otp_model.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/login')
  Future<BaseResponse<LoginResponse>> login(@Body() LoginModel loginModel);

  @POST('/auth/signup')
  Future<BaseResponse<SignupResp>> signup(@Body() SignupModel signupModel);

  @POST('/auth/forgot-password')
  Future<BaseResponse<ForgetPasswordResp>> forgetPassword(
      @Body() ForgetPasswordModel forgetPassword);

  @POST('/auth/verify-otp')
  Future<BaseResponse> veriftOTP(@Body() VerifyOtpModel verifyOtpModel);

  @PUT('/auth/password')
  Future<BaseResponse> resetPassword(
      @Body() ResetPasswordModel resetPasswordModel);

  @GET('/categories')
  Future<BaseResponse<List<CategoryResp>>> getCategories();

  @PATCH('/profile')
  Future<BaseResponse<Profile>> updatePhoneNumber(
      @Body() PhoneNumerModel phoneNumerModel);

  @GET('/profile')
  Future<BaseResponse<Profile>> getProfile();

  @POST('/profile/change-password')
  Future<BaseResponse> changePass(
      @Body() ChangePasswordModel changePasswordModel);

  @POST('/media/upload')
  @MultiPart()
  Future<BaseResponse<UploadFileResp>> uploadFiles(@Part() File file);

  @POST('/profile/instructor')
  Future<BaseResponse<InstructorResp>> becomeAnInstructor(
      @Body() BecomeInstructorModel becomeInstructorModel);
}
