import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

abstract class ProfileRepo {
  Future<BaseResponse<Profile>> getProfile();
  Future<BaseResponse<Profile>> updatePhone(PhoneNumerModel phoneNumerModel);
  Future<BaseResponse> changePasswd(ChangePasswordModel changePasswordModel);
}
