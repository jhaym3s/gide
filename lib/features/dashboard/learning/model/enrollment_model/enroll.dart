// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'course.dart';
import 'progress.dart';

class Enroll extends Equatable {
  final Progress? progress;
  final String? id;
  final Course? course;
  final String? user;
  final String? status;
  final int? totalModulesEnrolled;
  final int? totalLessonsEnrolled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Enroll({
    this.progress,
    this.id,
    this.course,
    this.user,
    this.status,
    this.totalModulesEnrolled,
    this.totalLessonsEnrolled,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Enroll.fromJson(Map<String, dynamic> json) => Enroll(
        progress: json['progress'] == null
            ? null
            : Progress.fromJson(json['progress'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        course: json['course'] == null
            ? null
            : Course.fromJson(json['course'] as Map<String, dynamic>),
        user: json['user'] as String?,
        status: json['status'] as String?,
        totalModulesEnrolled: json['totalModulesEnrolled'] as int?,
        totalLessonsEnrolled: json['totalLessonsEnrolled'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'progress': progress?.toJson(),
        '_id': id,
        'course': course?.toJson(),
        'user': user,
        'status': status,
        'totalModulesEnrolled': totalModulesEnrolled,
        'totalLessonsEnrolled': totalLessonsEnrolled,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  Enroll copyWith({
    Progress? progress,
    String? id,
    Course? course,
    String? user,
    String? status,
    int? totalModulesEnrolled,
    int? totalLessonsEnrolled,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Enroll(
      progress: progress ?? this.progress,
      id: id ?? this.id,
      course: course ?? this.course,
      user: user ?? this.user,
      status: status ?? this.status,
      totalModulesEnrolled: totalModulesEnrolled ?? this.totalModulesEnrolled,
      totalLessonsEnrolled: totalLessonsEnrolled ?? this.totalLessonsEnrolled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props {
    return [
      progress,
      id,
      course,
      user,
      status,
      totalModulesEnrolled,
      totalLessonsEnrolled,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
