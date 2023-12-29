// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'course_model.dart';
import 'pagination.dart';

class AllCoursesModel extends Equatable {
  final Pagination? pagination;
  final List<CourseModel>? data;

  const AllCoursesModel({this.pagination, this.data});

  factory AllCoursesModel.fromJson(Map<String, dynamic> json) {
    return AllCoursesModel(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'pagination': pagination?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };

  AllCoursesModel copyWith({
    Pagination? pagination,
    List<CourseModel>? data,
  }) {
    return AllCoursesModel(
      pagination: pagination ?? this.pagination,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [pagination, data];
}
