// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/app_exception.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/core/services/network/rest_client.dart';
import 'package:gide/domain/model_response/query_filters.dart';
import 'package:gide/domain/repositories/courses_repo.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/all_courses_model.dart';
import 'package:gide/features/dashboard/explore/model/single_course_model/single_course_model.dart';

class CoursesImpl extends CourseRepo {
  final RestClient _client;

  CoursesImpl(this._client);

  @override
  Future<BaseResponse<AllCoursesModel>> getCourses(
      {required String searchQuery}) async {
    try {
      final resp = await _client.getAllCourses(FilterParams(search: searchQuery));
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
