import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String? id;
  final String? description;
  final String? videoUrl;
  final String? virtualSessionUrl;
  final int? points;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Lesson({
    this.id,
    this.description,
    this.videoUrl,
    this.virtualSessionUrl,
    this.points,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['_id'] as String?,
        description: json['description'] as String?,
        videoUrl: json['videoUrl'] as String?,
        virtualSessionUrl: json['virtualSessionUrl'] as String?,
        points: json['points'] as int?,
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
        '_id': id,
        'description': description,
        'videoUrl': videoUrl,
        'virtualSessionUrl': virtualSessionUrl,
        'points': points,
        'createdBy': createdBy,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  Lesson copyWith({
    String? id,
    String? description,
    String? videoUrl,
    String? virtualSessionUrl,
    int? points,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Lesson(
      id: id ?? this.id,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      virtualSessionUrl: virtualSessionUrl ?? this.virtualSessionUrl,
      points: points ?? this.points,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      description,
      videoUrl,
      virtualSessionUrl,
      points,
      createdBy,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
