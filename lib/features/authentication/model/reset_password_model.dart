// Package imports:
import 'package:equatable/equatable.dart';

class ResetPasswordModel extends Equatable {
  final String? email;
  final String? reference;
  final String? password;
  final String? confirmPassword;

  const ResetPasswordModel({
    this.email,
    this.reference,
    this.password,
    this.confirmPassword,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      email: json['email'] as String?,
      reference: json['reference'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'reference': reference,
        'password': password,
        'confirmPassword': confirmPassword,
      };

  ResetPasswordModel copyWith({
    String? email,
    String? reference,
    String? password,
    String? confirmPassword,
  }) {
    return ResetPasswordModel(
      email: email ?? this.email,
      reference: reference ?? this.reference,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
      reference,
      password,
      confirmPassword,
    ];
  }
}
