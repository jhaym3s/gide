// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/all_courses_model.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/course_model.dart';
import 'package:gide/features/dashboard/explore/model/single_course_model/single_course_model.dart';

class CourseState {
  final AllCoursesModel? allCoursesModel;
  final List<CourseModel>? featuredCoursesModel;
  final SingleCourseModel? singleCourseModel;
  final LoadState? loadState;
  final String errorMessage;

  CourseState({
    this.errorMessage = '',
    this.loadState,
    this.allCoursesModel,
    this.singleCourseModel,
    this.featuredCoursesModel,
  });

  factory CourseState.initialState() {
    return CourseState(
        errorMessage: '',
        loadState: LoadState.idle,
        featuredCoursesModel: null,
        allCoursesModel: null,
        singleCourseModel: null);
  }

  CourseState copyWith({
    AllCoursesModel? allCoursesModel,
    List<CourseModel>? featuredCoursesModel,
    SingleCourseModel? singleCourseModel,
    String? errorMessage,
    LoadState? loadState,
  }) {
    return CourseState(
        errorMessage: errorMessage ?? this.errorMessage,
        loadState: loadState ?? this.loadState,
        allCoursesModel: allCoursesModel ?? this.allCoursesModel,
        singleCourseModel: singleCourseModel ?? this.singleCourseModel,
        featuredCoursesModel:
            featuredCoursesModel ?? this.featuredCoursesModel);
  }
}
