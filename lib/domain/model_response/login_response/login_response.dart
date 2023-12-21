import 'package:equatable/equatable.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

class LoginResponse extends Equatable {
  final String? token;
  final Profile? user;

  const LoginResponse({this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
