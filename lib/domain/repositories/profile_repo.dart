// Dart imports:
import 'dart:io';

// Project imports:
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/instructor_resp.dart';
import 'package:gide/domain/model_response/upload_file_resp.dart';
import 'package:gide/features/dashboard/profile/become_instructor_model.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/features/dashboard/profile/model/profile.dart';

abstract class ProfileRepo {
  Future<BaseResponse<Profile>> getProfile();
  Future<BaseResponse<Profile>> updatePhone(PhoneNumerModel phoneNumerModel);
  Future<BaseResponse> changePasswd(ChangePasswordModel changePasswordModel);
  Future<BaseResponse<UploadFileResp>> uploadFile(File file);
  Future<BaseResponse<InstructorResp>> becomeInstructor(
      BecomeInstructorModel becomeInstructorModel);
}
