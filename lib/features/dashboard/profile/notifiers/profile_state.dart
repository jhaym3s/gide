import 'package:gide/core/components/app_enums.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/features/authentication/model/signup_model.dart';

class ProfileState {
  final LoadState? loadState;
  final LoginResponse? loginresponse;
  final String errorMessage;

  ProfileState({
    this.loginresponse,
    this.errorMessage = '',
    this.loadState,
  });

  factory ProfileState.initialState() {
    return ProfileState(
        errorMessage: '', loginresponse: null, loadState: LoadState.idle);
  }

  ProfileState copyWith(
      {
        LoginResponse? loginresponse,
      String? errorMessage,
      LoadState? loadState}) {
    return ProfileState(
      loginresponse: loginresponse ?? this.loginresponse,
      errorMessage: errorMessage ?? this.errorMessage,
      loadState: loadState ?? this.loadState,
    );
  }
}
