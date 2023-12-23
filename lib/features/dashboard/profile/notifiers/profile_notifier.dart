import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/model_response/phone_numer_model.dart';
import 'package:gide/domain/repositories/profile_repo.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/dashboard/profile/data/profile_repo_impl.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_state.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(
    this.userRepository,
    this.authRepo,
  ) : super(ProfileState.initialState());

  final UserRepository userRepository;
  final ProfileRepo authRepo;

  Future<void> updatePhoneNum(PhoneNumerModel data) async {
    debugLog('Updating Phone number');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await authRepo.updatePhone(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        userRepository.saveProfile(
          response.data!.user ?? const Profile(),
        );

        state = state.copyWith(
          loadState: LoadState.success,
        );
        debugLog('current user data ${userRepository.getProfile()}');
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
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (_) => ProfileNotifier(
    _.read(userRepoProvider),
    _.read(profileRepoProv),
  ),
);
