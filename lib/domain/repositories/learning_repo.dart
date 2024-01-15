// Project imports:
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/domain/model_response/create_enrollment_resp/create_enrollment_resp.dart';
import 'package:gide/features/dashboard/learning/model/create_enrollment.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enrollment_model.dart';

abstract class LearningRepo {
  Future<BaseResponse<EnrollmentModel>> getEnrollment();
  Future<BaseResponse<CreateEnrollmentResp>> createEnrollment(
      {CreateEnrollment createEnrollment});
}
