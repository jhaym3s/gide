import 'package:equatable/equatable.dart';

class BecomeInstructorModel extends Equatable {
  final String? gender;
  final String? image;
  final String? resume;
  final String? bio;

  const BecomeInstructorModel({
    this.gender,
    this.image,
    this.resume,
    this.bio,
  });

  factory BecomeInstructorModel.fromJson(Map<String, dynamic> json) {
    return BecomeInstructorModel(
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      resume: json['resume'] as String?,
      bio: json['bio'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'image': image,
        'resume': resume,
        'bio': bio,
      };

  BecomeInstructorModel copyWith({
    String? gender,
    String? image,
    String? resume,
    String? bio,
  }) {
    return BecomeInstructorModel(
      gender: gender ?? this.gender,
      image: image ?? this.image,
      resume: resume ?? this.resume,
      bio: bio ?? this.bio,
    );
  }

  @override
  List<Object?> get props => [gender, image, resume, bio];
}
