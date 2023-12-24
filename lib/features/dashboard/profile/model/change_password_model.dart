import 'package:equatable/equatable.dart';

class ChangePasswordModel extends Equatable {
  final String? oldPassword;
  final String? newPassword;
  final String? confirmPassword;

  const ChangePasswordModel({
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      };

  @override
  List<Object?> get props => [oldPassword, newPassword, confirmPassword];
}
