// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/app_exception.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/core/services/network/rest_client.dart';
import 'package:gide/domain/model_response/forget_password_resp.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/domain/model_response/signup_response/signup_resp/signup_resp.dart';
import 'package:gide/domain/repositories/auth_repository.dart';
import 'package:gide/domain/repositories/courses_repo.dart';
import 'package:gide/features/authentication/model/forget_password.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/model/reset_password_model.dart';
import 'package:gide/features/authentication/model/signup_model.dart';
import 'package:gide/features/authentication/model/verify_otp_model.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/all_courses_model.dart';
import 'package:gide/features/dashboard/explore/model/single_course_model/single_course_model.dart';

class CoursesImpl extends CourseRepo {
  final RestClient _client;

  CoursesImpl(this._client);

  @override
  Future<BaseResponse<AllCoursesModel>> getCourses() async {
    try {
      final resp = await _client.getAllCourses();
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse<SingleCourseModel>> getSingleCourse({String? id}) async {
    try {
      final resp = await _client.getSingleCourse(id: id);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }
}

final courseRepoProv =
    Provider((ref) => CoursesImpl(ref.read(restClientProvider)));
