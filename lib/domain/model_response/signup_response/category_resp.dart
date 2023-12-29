// Package imports:
import 'package:equatable/equatable.dart';

class CategoryResp extends Equatable {
  final String? id;
  final String? name;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryResp({
    this.id,
    this.name,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryResp.fromJson(Map<String, dynamic> json) => CategoryResp(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  CategoryResp copyWith({
    String? id,
    String? name,
    int? v,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryResp(
      id: id ?? this.id,
      name: name ?? this.name,
      v: v ?? this.v,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, v, createdAt, updatedAt];
}
