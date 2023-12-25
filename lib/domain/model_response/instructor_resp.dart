import 'package:equatable/equatable.dart';

class InstructorResp extends Equatable {
  final String? gender;
  final String? image;
  final String? resume;
  final String? bio;
  final String? user;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const InstructorResp({
    this.gender,
    this.image,
    this.resume,
    this.bio,
    this.user,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory InstructorResp.fromJson(Map<String, dynamic> json) {
    return InstructorResp(
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      resume: json['resume'] as String?,
      bio: json['bio'] as String?,
      user: json['user'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'image': image,
        'resume': resume,
        'bio': bio,
        'user': user,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      gender,
      image,
      resume,
      bio,
      user,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
