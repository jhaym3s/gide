import 'package:equatable/equatable.dart';

class Instructor extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accountType;
  final List<String>? interests;
  final String? bio;
  final String? occupation;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? fullName;
  final int? v;
  final String? profilePicture;

  const Instructor({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accountType,
    this.interests,
    this.bio,
    this.occupation,
    this.createdAt,
    this.updatedAt,
    this.fullName,
    this.v,
    this.profilePicture,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        accountType: json['accountType'] as String?,
        interests: json['interests'] as List<String>?,
        bio: json['bio'] as String?,
        occupation: json['occupation'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        fullName: json['fullName'] as String?,
        v: json['__v'] as int?,
        profilePicture: json['profilePicture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'accountType': accountType,
        'interests': interests,
        'bio': bio,
        'occupation': occupation,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'fullName': fullName,
        '__v': v,
        'profilePicture': profilePicture,
      };

  Instructor copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? accountType,
    List<String>? interests,
    String? bio,
    String? occupation,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? fullName,
    int? v,
    String? profilePicture,
  }) {
    return Instructor(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      accountType: accountType ?? this.accountType,
      interests: interests ?? this.interests,
      bio: bio ?? this.bio,
      occupation: occupation ?? this.occupation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fullName: fullName ?? this.fullName,
      v: v ?? this.v,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      accountType,
      interests,
      bio,
      occupation,
      createdAt,
      updatedAt,
      fullName,
      v,
      profilePicture,
    ];
  }
}
