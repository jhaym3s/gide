// Package imports:
import 'package:equatable/equatable.dart';

class VerifyOtpModel extends Equatable {
  final String? email;
  final String? reference;
  final String? code;

  const VerifyOtpModel({this.email, this.reference, this.code});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      email: json['email'] as String?,
      reference: json['reference'] as String?,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'reference': reference,
        'code': code,
      };

  VerifyOtpModel copyWith({
    String? email,
    String? reference,
    String? code,
  }) {
    return VerifyOtpModel(
      email: email ?? this.email,
      reference: reference ?? this.reference,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [email, reference, code];
}
