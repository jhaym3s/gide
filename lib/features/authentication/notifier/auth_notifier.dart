import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/domain/repositories/auth_responsitory.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/authentication/data/auth_impl.dart';
import 'package:gide/features/authentication/model/forget_password.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/model/signup_model.dart';
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
        saveDetails(response.data!.user ?? const Profile(),
            response.data!.token!, CurrentState.loggedIn);

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
    } finally {
      state = state.copyWith(loginLoadState: LoginLoadState.idle);
    }
  }

  saveDetails(Profile profile, String token, CurrentState currentstate) {
    userRepository.setCurrentProfile(profile);
    userRepository.saveCurrentState(currentstate);
    userRepository.saveToken(token);
  }

  Future<String?> signup(SignupModel data) async {
    debugLog('sign up data been sent is ${state.signupModel.toString()}');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await authRepo.signUp(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
          loadState: LoadState.success,
        );
        toastMessage('${response.message}');
        return response.message;
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, loadState: LoadState.error);
        return response.message;
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
  Future forgetPass(ForgetPasswordModel data) async {
    debugLog('Attemping to forget password');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await authRepo.forgetPassword(data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        state = state.copyWith(
          loadState: LoadState.success,
          //!email saved with error message
          errorMessage: data.email,
        );
        toastMessage('${response.message}');
        return response.message;
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, loadState: LoadState.error);
        return response.message;
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

  Future<List<CategoryResp>>? getCatergories() async {
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Attempting to get category');
    try {
      final response = await authRepo.getCategory();
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugLog('Category Details: ${response.data.toString()}');

        state = state.copyWith(
            categoryList: response.data, loadState: LoadState.success);
        return response.data??[];
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(loadState: LoadState.done);
    }
    return state.categoryList ?? [];
  }

  void saveSignupData(SignupModel signupModel) {
    state = state.saveSignupData(signupModel);
    debugLog('sign up data saved is ${state.signupModel.toString()}');
  }
  
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (_) => AuthNotifier(
    _.read(userRepoProvider),
    _.read(authRepoProv),
  ),
);
