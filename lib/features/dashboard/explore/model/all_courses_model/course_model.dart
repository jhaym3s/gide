import 'package:equatable/equatable.dart';

import 'course_length.dart';
import 'instructor.dart';

class CourseModel extends Equatable {
  final CourseLength? courseLength;
  final String? id;
  final String? title;
  final String? description;
  final bool? featured;
  final List<Instructor>? instructors;
  final List<dynamic>? modules;
  final int? points;
  final int? price;
  final bool? deleted;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const CourseModel({
    this.courseLength,
    this.id,
    this.title,
    this.description,
    this.featured,
    this.instructors,
    this.modules,
    this.points,
    this.price,
    this.deleted,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courseLength: json['courseLength'] == null
            ? null
            : CourseLength.fromJson(
                json['courseLength'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        featured: json['featured'] as bool?,
        instructors: (json['instructors'] as List<dynamic>?)
            ?.map((e) => Instructor.fromJson(e as Map<String, dynamic>))
            .toList(),
        modules: json['modules'] as List<dynamic>?,
        points: json['points'] as int?,
        price: json['price'] as int?,
        deleted: json['deleted'] as bool?,
        deletedAt: json['deletedAt'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'courseLength': courseLength?.toJson(),
        '_id': id,
        'title': title,
        'description': description,
        'featured': featured,
        'instructors': instructors?.map((e) => e.toJson()).toList(),
        'modules': modules,
        'points': points,
        'price': price,
        'deleted': deleted,
        'deletedAt': deletedAt,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  CourseModel copyWith({
    CourseLength? courseLength,
    String? id,
    String? title,
    String? description,
    bool? featured,
    List<Instructor>? instructors,
    List<dynamic>? modules,
    int? points,
    int? price,
    bool? deleted,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return CourseModel(
      courseLength: courseLength ?? this.courseLength,
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      featured: featured ?? this.featured,
      instructors: instructors ?? this.instructors,
      modules: modules ?? this.modules,
      points: points ?? this.points,
      price: price ?? this.price,
      deleted: deleted ?? this.deleted,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props {
    return [
      courseLength,
      id,
      title,
      description,
      featured,
      instructors,
      modules,
      points,
      price,
      deleted,
      deletedAt,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
