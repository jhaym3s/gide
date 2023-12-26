import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/repositories/courses_repo.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/dashboard/explore/data/courses_repo_impl.dart';
import 'package:gide/features/dashboard/explore/notifier.dart/course_state.dart';

class CourseNotifier extends StateNotifier<CourseState> {
  CourseNotifier(
    this.userRepository,
    this.courseRepo,
  ) : super(CourseState.initialState());

  final UserRepository userRepository;
  final CourseRepo courseRepo;

  Future<void> getallCourses() async {
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Attempting to get all courses');
    try {
      final response = await courseRepo.getCourses();
      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
            allCoursesModel: response.data, loadState: LoadState.success);
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(loadState: LoadState.done);
    }
  }
  Future getSingleCou({required String id}) async {
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Attempting to get single courses');
    try {
      final response = await courseRepo.getSingleCourse(id: id);
      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
            singleCourseModel: response.data, loadState: LoadState.success);
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(loadState: LoadState.done);
    }
  }
}

final courseProvider = StateNotifierProvider<CourseNotifier, CourseState>(
  (_) => CourseNotifier(
    _.read(userRepoProvider),
    _.read(courseRepoProv),
  ),
);
