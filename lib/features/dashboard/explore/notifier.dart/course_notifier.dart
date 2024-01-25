// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/repositories/courses_repo.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/dashboard/explore/data/courses_repo_impl.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/course_model.dart';
import 'package:gide/features/dashboard/explore/notifier.dart/course_state.dart';

class CourseNotifier extends StateNotifier<CourseState> {
  CourseNotifier(
    this.userRepository,
    this.courseRepo,
  ) : super(CourseState.initialState());

  final UserRepository userRepository;
  final CourseRepo courseRepo;

  Future<void> getallCourses({required String searchQuery}) async {
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Attempting to get all courses');
    try {
      final response = await courseRepo.getCourses(searchQuery: searchQuery);
      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
            allCoursesModel: response.data, loadState: LoadState.success);
        List<CourseModel> featured = [];
        for (CourseModel singleData in response.data?.data ?? []) {
          if (singleData.featured ?? false) {
            featured.add(singleData);
          }
        }
        state = state.copyWith(featuredCoursesModel: [...featured]);
        debugLog(
            'Updated featured list length : ${state.featuredCoursesModel?.length ?? 0}');
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

  String formatTime(DateTime dateTime) {
    String period = dateTime.hour >= 12 ? 'pm' : 'am';
    int formattedHour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    String formattedMinute = dateTime.minute.toString().padLeft(2, '0');

    return '$formattedHour:$formattedMinute$period';
  }
}

final courseProvider = StateNotifierProvider<CourseNotifier, CourseState>(
  (_) => CourseNotifier(
    _.read(userRepoProvider),
    _.read(courseRepoProv),
  ),
);
