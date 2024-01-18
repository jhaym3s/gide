// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'progress.dart';

class CreateEnrollmentResp extends Equatable {
  final String? course;
  final String? user;
  final String? status;
  final int? totalModulesEnrolled;
  final int? totalLessonsEnrolled;
  final Progress? progress;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const CreateEnrollmentResp({
    this.course,
    this.user,
    this.status,
    this.totalModulesEnrolled,
    this.totalLessonsEnrolled,
    this.progress,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CreateEnrollmentResp.fromJson(Map<String, dynamic> json) {
    return CreateEnrollmentResp(
      course: json['course'] as String?,
      user: json['user'] as String?,
      status: json['status'] as String?,
      totalModulesEnrolled: json['totalModulesEnrolled'] as int?,
      totalLessonsEnrolled: json['totalLessonsEnrolled'] as int?,
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress'] as Map<String, dynamic>),
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
        'course': course,
        'user': user,
        'status': status,
        'totalModulesEnrolled': totalModulesEnrolled,
        'totalLessonsEnrolled': totalLessonsEnrolled,
        'progress': progress?.toJson(),
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  CreateEnrollmentResp copyWith({
    String? course,
    String? user,
    String? status,
    int? totalModulesEnrolled,
    int? totalLessonsEnrolled,
    Progress? progress,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return CreateEnrollmentResp(
      course: course ?? this.course,
      user: user ?? this.user,
      status: status ?? this.status,
      totalModulesEnrolled: totalModulesEnrolled ?? this.totalModulesEnrolled,
      totalLessonsEnrolled: totalLessonsEnrolled ?? this.totalLessonsEnrolled,
      progress: progress ?? this.progress,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props {
    return [
      course,
      user,
      status,
      totalModulesEnrolled,
      totalLessonsEnrolled,
      progress,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
