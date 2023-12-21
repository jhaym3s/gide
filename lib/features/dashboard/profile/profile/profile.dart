// Package imports:
import 'package:equatable/equatable.dart';

class Profile extends Equatable {
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

  const Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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

  Profile copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? accountType,
    List<String>? interests,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? fullName,
    int? v,
  }) {
    return Profile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      accountType: accountType ?? this.accountType,
      interests: interests ?? this.interests,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fullName: fullName ?? this.fullName,
      v: v ?? this.v,
    );
  }

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
