// Package imports:
import 'package:equatable/equatable.dart';
import 'package:gide/features/dashboard/profile/model/profile.dart';

// Project imports:
// import 'user.dart';

class SignupResp extends Equatable {
  final String? token;
  final Profile? user;

  const SignupResp({this.token, this.user});

  factory SignupResp.fromJson(Map<String, dynamic> json) => SignupResp(
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : Profile.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [token, user];
}
