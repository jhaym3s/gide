import 'package:equatable/equatable.dart';

class PhoneNumerModel extends Equatable {
  final String? phoneNumber;

  const PhoneNumerModel({this.phoneNumber});

  factory PhoneNumerModel.fromJson(Map<String, dynamic> json) {
    return PhoneNumerModel(
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
      };

  @override
  List<Object?> get props => [phoneNumber];
}
