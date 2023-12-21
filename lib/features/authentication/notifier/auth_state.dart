import 'package:gide/core/components/app_enums.dart';
import 'package:gide/domain/model_response/login_response/login_response.dart';

class AuthState {
  final LoginLoadState loginLoadState;
  final LoginResponse? loginresponse;
  final String errorMessage;
  AuthState({
    required this.loginLoadState,
    this.loginresponse,
    this.errorMessage = '',
  });

  factory AuthState.initialState() {
    return AuthState(
      loginLoadState: LoginLoadState.idle,
      errorMessage: '',
      loginresponse: null,
    );
  }

  AuthState copyWith({
    LoginLoadState? loginLoadState,
    LoginResponse? loginresponse,
    String? errorMessage,
  }) {
    return AuthState(
      loginLoadState: loginLoadState ?? this.loginLoadState,
      loginresponse: loginresponse ?? this.loginresponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
