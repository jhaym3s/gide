import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? accountType;
  final List<String>? interests;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? fullName;
  final int? v;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.accountType,
    this.interests,
    this.createdAt,
    this.updatedAt,
    this.fullName,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        accountType: json['accountType'] as String?,
        interests: json['interests'] as List<String>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        fullName: json['fullName'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'accountType': accountType,
        'interests': interests,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'fullName': fullName,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      phoneNumber,
      accountType,
      interests,
      createdAt,
      updatedAt,
      fullName,
      v,
    ];
  }
}
