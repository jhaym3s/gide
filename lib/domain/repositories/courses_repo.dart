// Project imports:
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/all_courses_model.dart';
import 'package:gide/features/dashboard/explore/model/single_course_model/single_course_model.dart';

abstract class CourseRepo {
  Future<BaseResponse<AllCoursesModel>> getCourses();
  Future<BaseResponse<SingleCourseModel>> getSingleCourse({String? id});
}
