// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/repositories/learning_repo.dart';
import 'package:gide/features/dashboard/learning/data/learning_repo_impl.dart';
import 'package:gide/features/dashboard/learning/model/create_enrollment.dart';
import 'package:gide/features/dashboard/learning/notifiers/enroll_state.dart';

class EnrollNotifier extends StateNotifier<EnrollState> {
  EnrollNotifier(
    this.learningRepo,
  ) : super(EnrollState.initialState());

  final LearningRepo learningRepo;

  Future<void> getEnrolled() async {
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Attempting to get enrolled courses');
    try {
      final response = await learningRepo.getEnrollment();
      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
            enrollModel: response.data, loadState: LoadState.success);
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

  Future createEnroll({required String courseId}) async {
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Attempting to create enrollment');
    try {
      final response = await learningRepo.createEnrollment(
          createEnrollment: CreateEnrollment(courseId: courseId));
      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
            createEnroll: response.data, loadState: LoadState.success);
        toastMessage(response.message ?? 'Success');
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

final enrollProv = StateNotifierProvider<EnrollNotifier, EnrollState>(
  (_) => EnrollNotifier(
    _.read(enrollRroviderImpl),
  ),
);
