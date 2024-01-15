// Package imports:
import 'package:equatable/equatable.dart';

class Instructor extends Equatable {
  final List<dynamic>? interests;
  final String? id;
  final String? fullName;
  final String? email;
  final String? accountType;
  final List<dynamic>? courses;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? firstname, lastname, bio, occupation, profilePicture;
  final int? v;

  const Instructor({
    this.interests,
    this.id,
    this.fullName,
    this.email,
    this.accountType,
    this.courses,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.firstname,
    this.lastname,
    this.bio,
    this.occupation,
    this.profilePicture,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        interests: json['interests'] as List<dynamic>?,
        id: json['_id'] as String?,
        fullName: json['fullName'] as String?,
        email: json['email'] as String?,
        accountType: json['accountType'] as String?,
        courses: json['courses'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        bio: json['bio'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        occupation: json['occupation'],
        profilePicture: json['profilePicture'],
      );

  Map<String, dynamic> toJson() => {
        'interests': interests,
        '_id': id,
        'fullName': fullName,
        'email': email,
        'accountType': accountType,
        'courses': courses,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'profilePicture': profilePicture,
        'firstname': firstname,
        'lastName': lastname,
        'occupation': occupation,
        'bio': bio,
      };

  Instructor copyWith({
    List<dynamic>? interests,
    String? id,
    String? fullName,
    String? email,
    String? accountType,
    List<dynamic>? courses,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? firstname,
    String? lastname,
    String? bio,
    String? occupation,
    String? profilePicture,
    int? v,
  }) {
    return Instructor(
      interests: interests ?? this.interests,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      accountType: accountType ?? this.accountType,
      courses: courses ?? this.courses,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      occupation: occupation ?? this.occupation,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
    );
  }

  @override
  List<Object?> get props {
    return [
      interests,
      id,
      fullName,
      email,
      accountType,
      courses,
      createdAt,
      updatedAt,
      firstname,
      lastname,
      occupation,
      profilePicture,
      bio,
    ];
  }
}
