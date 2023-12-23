import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/phone_numer_model.dart';

abstract class ProfileRepo {
  Future<BaseResponse<LoginResponse>> updatePhone(
      PhoneNumerModel phoneNumerModel);
}
