// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/domain/model_response/create_enrollment_resp/create_enrollment_resp.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/all_courses_model.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/course_model.dart';
import 'package:gide/features/dashboard/explore/model/single_course_model/single_course_model.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enroll.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enrollment_model.dart';

class EnrollState {
  final CreateEnrollmentResp? createEnrollmentResp;
  final EnrollmentModel? enrollmentModel;
  final List<Enroll>? completedCourses;
  final LoadState? loadState;
  final String errorMessage;

  EnrollState(
      {this.errorMessage = '',
      this.loadState,
      this.createEnrollmentResp,
      this.completedCourses,
      this.enrollmentModel});

  factory EnrollState.initialState() {
    return EnrollState(
        errorMessage: '',
        loadState: LoadState.idle,
        createEnrollmentResp: null,
        enrollmentModel: null,
        completedCourses: []);
  }

  EnrollState copyWith(
      {String? errorMessage,
      LoadState? loadState,
      CreateEnrollmentResp? createEnroll,
      EnrollmentModel? enrollModel,
      List<Enroll>? completedCourses}) {
    return EnrollState(
      errorMessage: errorMessage ?? this.errorMessage,
      loadState: loadState ?? this.loadState,
      createEnrollmentResp: createEnroll ?? createEnrollmentResp,
      enrollmentModel: enrollModel ?? enrollmentModel,
      completedCourses: completedCourses ?? this.completedCourses,
    );
  }
}
