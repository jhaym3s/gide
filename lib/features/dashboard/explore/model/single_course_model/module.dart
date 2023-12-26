import 'package:equatable/equatable.dart';

import 'length.dart';
import 'lesson.dart';

class Module extends Equatable {
  final Length? length;
  final String? id;
  final String? name;
  final bool? allowPreview;
  final List<Lesson>? lessons;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Module({
    this.length,
    this.id,
    this.name,
    this.allowPreview,
    this.lessons,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        length: json['length'] == null
            ? null
            : Length.fromJson(json['length'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        name: json['name'] as String?,
        allowPreview: json['allowPreview'] as bool?,
        lessons: (json['lessons'] as List<dynamic>?)
            ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdBy: json['createdBy'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'length': length?.toJson(),
        '_id': id,
        'name': name,
        'allowPreview': allowPreview,
        'lessons': lessons?.map((e) => e.toJson()).toList(),
        'createdBy': createdBy,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  Module copyWith({
    Length? length,
    String? id,
    String? name,
    bool? allowPreview,
    List<Lesson>? lessons,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Module(
      length: length ?? this.length,
      id: id ?? this.id,
      name: name ?? this.name,
      allowPreview: allowPreview ?? this.allowPreview,
      lessons: lessons ?? this.lessons,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props {
    return [
      length,
      id,
      name,
      allowPreview,
      lessons,
      createdBy,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
