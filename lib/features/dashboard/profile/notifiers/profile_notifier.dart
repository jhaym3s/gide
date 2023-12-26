import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/features/dashboard/profile/become_instructor_model.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/domain/repositories/profile_repo.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/dashboard/profile/data/profile_repo_impl.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_state.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(
    this.userRepository,
    this.profileRepo,
  ) : super(ProfileState.initialState());

  final UserRepository userRepository;
  final ProfileRepo profileRepo;
  //!todo fetch user profile and update it on setting screen

  Future getProfile() async {
    try {
      final response = await profileRepo.getProfile();
      if (response.statusCode == 201 || response.statusCode == 200) {
        // debugLog('Profile Details: ${response.data.toString()}');
        userRepository.setCurrentProfile(response.data ?? const Profile());
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> updatePhoneNum(PhoneNumerModel data) async {
    debugLog('Updating Phone number');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await profileRepo.updatePhone(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        userRepository.setCurrentProfile(
          response.data ?? const Profile(),
        );

        state = state.copyWith(
          loadState: LoadState.success,
        );
        toastMessage('${response.message}');
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, loadState: LoadState.error);
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    } finally {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }

  Future<void> changePwd(ChangePasswordModel data) async {
    debugLog('Changing Password');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await profileRepo.changePasswd(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        userRepository.saveCurrentState(CurrentState.onboarded);
        state = state.copyWith(
          loadState: LoadState.success,
        );
        toastMessage('${response.message}');
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, loadState: LoadState.error);
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    } finally {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }

  Future<void> becomeInstru(BecomeInstructorModel data) async {
    debugLog('Attemping to become an instructor');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await profileRepo.becomeInstructor(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        userRepository.saveCurrentState(CurrentState.onboarded);
        state = state.copyWith(
          loadState: LoadState.success,
        );
        toastMessage('${response.message}');
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, loadState: LoadState.error);
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    } finally {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }

  Future<String?> uploadFileData({required File filePath}) async {
    try {
      state = state.copyWith(uploadLoadState: LoadState.loading);
      debugLog('Data Sent: $filePath');
      final response = await profileRepo.uploadFile(filePath);
      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
          uploadLoadState: LoadState.success,
        );
        debugLog('File data recieved ${response.data}');

        return response.data?.url ?? '';
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, uploadLoadState: LoadState.error);
      }
    } catch (e) {
      state = state.copyWith(
        uploadLoadState: LoadState.error,
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(uploadLoadState: LoadState.idle);
    }
    return null;
  }

  void logout() {
    userRepository.setCurrentProfile(const Profile());
    userRepository.saveCurrentState(CurrentState.onboarded);
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (_) => ProfileNotifier(
    _.read(userRepoProvider),
    _.read(profileRepoProv),
  ),
);
