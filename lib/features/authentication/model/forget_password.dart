// Package imports:
import 'package:equatable/equatable.dart';

class ForgetPasswordModel extends Equatable {
  final String? email;

  const ForgetPasswordModel({this.email});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  ForgetPasswordModel copyWith({
    String? email,
  }) {
    return ForgetPasswordModel(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [email];
}
