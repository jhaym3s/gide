import 'package:equatable/equatable.dart';

class CreateEnrollment extends Equatable {
  final String? courseId;

  const CreateEnrollment({this.courseId});

  factory CreateEnrollment.fromJson(Map<String, dynamic> json) {
    return CreateEnrollment(
      courseId: json['courseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'courseId': courseId,
      };

  CreateEnrollment copyWith({
    String? courseId,
  }) {
    return CreateEnrollment(
      courseId: courseId ?? this.courseId,
    );
  }

  @override
  List<Object?> get props => [courseId];
}
