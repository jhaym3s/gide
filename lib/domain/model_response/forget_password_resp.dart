// Package imports:
import 'package:equatable/equatable.dart';

class ForgetPasswordResp extends Equatable {
  final String? reference;

  const ForgetPasswordResp({this.reference});

  factory ForgetPasswordResp.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResp(
      reference: json['reference'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'reference': reference,
      };

  @override
  List<Object?> get props => [reference];
}
