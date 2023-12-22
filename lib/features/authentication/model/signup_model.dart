import 'package:equatable/equatable.dart';

class SignupModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? accountType;
  final List<String>? interests;

  const SignupModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.accountType,
    this.interests,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        accountType: json['accountType'] as String?,
        interests: json['interests'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'accountType': accountType,
        'interests': interests,
      };

  SignupModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? accountType,
    List<String>? interests,
  }) {
    return SignupModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      accountType: accountType ?? this.accountType,
      interests: interests ?? this.interests,
    );
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      password,
      accountType,
      interests,
    ];
  }
}
