// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';

class ProfileState {
  final LoadState? loadState;
  final LoadState? uploadLoadState;
  final LoginResponse? loginresponse;
  final String errorMessage;

  ProfileState(
      {this.loginresponse,
      this.errorMessage = '',
      this.loadState,
      this.uploadLoadState});

  factory ProfileState.initialState() {
    return ProfileState(
        errorMessage: '',
        loginresponse: null,
        loadState: LoadState.idle,
        uploadLoadState: LoadState.idle);
  }

  ProfileState copyWith(
      {LoginResponse? loginresponse,
      String? errorMessage,
      LoadState? uploadLoadState,
      LoadState? loadState}) {
    return ProfileState(
        loginresponse: loginresponse ?? this.loginresponse,
        errorMessage: errorMessage ?? this.errorMessage,
        loadState: loadState ?? this.loadState,
        uploadLoadState: uploadLoadState ?? this.uploadLoadState);
  }
}
