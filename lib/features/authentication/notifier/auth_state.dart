// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/features/authentication/model/signup_model.dart';

class AuthState {
  final LoginLoadState? loginLoadState;
  final LoadState? loadState;
  final LoginResponse? loginresponse;
  final String errorMessage;
  final SignupModel? signupModel;
  final List<CategoryResp>? categoryList;
  AuthState({
    this.loginLoadState,
    this.loginresponse,
    this.errorMessage = '',
    this.loadState,
    this.signupModel,
    this.categoryList,
  });

  factory AuthState.initialState() {
    return AuthState(
        loginLoadState: LoginLoadState.idle,
        errorMessage: '',
        loginresponse: null,
        signupModel: null,
        categoryList: null,
        loadState: LoadState.idle);
  }
  AuthState saveSignupData(SignupModel? signupModel) {
    return AuthState(signupModel: signupModel ?? this.signupModel);
  }

  AuthState copyWith(
      {LoginLoadState? loginLoadState,
      LoginResponse? loginresponse,
      String? errorMessage,
      LoadState? loadState,
      List<CategoryResp>? categoryList}) {
    return AuthState(
      loginLoadState: loginLoadState ?? this.loginLoadState,
      loginresponse: loginresponse ?? this.loginresponse,
      errorMessage: errorMessage ?? this.errorMessage,
      loadState: loadState ?? this.loadState,
      categoryList: categoryList ?? this.categoryList,
    );
  }
}
