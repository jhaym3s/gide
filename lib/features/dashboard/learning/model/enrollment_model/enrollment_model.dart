// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'enroll.dart';
import 'pagination.dart';

class EnrollmentModel extends Equatable {
  final List<Enroll>? data;
  final Pagination? pagination;

  const EnrollmentModel({this.data, this.pagination});

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    return EnrollmentModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Enroll.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson(),
      };

  EnrollmentModel copyWith({
    List<Enroll>? data,
    Pagination? pagination,
  }) {
    return EnrollmentModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object?> get props => [data, pagination];
}
