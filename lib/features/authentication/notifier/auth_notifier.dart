import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/domain/repositories/auth_responsitory.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/authentication/data/auth_impl.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/notifier/auth_state.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(
    this.userRepository,
    this.authRepo,
  ) : super(AuthState.initialState());

  final UserRepository userRepository;
  final AuthRepo authRepo;

  Future<String?> login(LoginModel data) async {
    state = state.copyWith(loginLoadState: LoginLoadState.loading);
    try {
      final response = await authRepo.login(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        saveDetails(response.data!.user??const Profile()  , response.data!.token!,
            CurrentState.loggedIn);

        state = state.copyWith(
          loginresponse: response.data,
          loginLoadState: LoginLoadState.success,
        );
        toastMessage('${response.message}');
        return response.message;
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message,
            loginLoadState: LoginLoadState.error);
        return response.message;
      }
    } catch (e) {
      state = state.copyWith(
        loginLoadState: LoginLoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    }
  }

  saveDetails(Profile profile, String token, CurrentState currentstate) {
    userRepository.setCurrentProfile(profile);
    userRepository.saveCurrentState(currentstate);
    userRepository.saveToken(token);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (_) => AuthNotifier(
    _.read(userRepoProvider),
    _.read(authRepoProv),
  ),
);
