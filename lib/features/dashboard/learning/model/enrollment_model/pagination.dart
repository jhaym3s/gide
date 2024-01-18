// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'next.dart';
import 'prev.dart';

class Pagination extends Equatable {
  final int? totalRecords;
  final int? pageTotal;
  final Next? next;
  final Prev? prev;

  const Pagination({
    this.totalRecords,
    this.pageTotal,
    this.next,
    this.prev,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalRecords: json['totalRecords'] as int?,
        pageTotal: json['pageTotal'] as int?,
        next: json['next'] == null
            ? null
            : Next.fromJson(json['next'] as Map<String, dynamic>),
        prev: json['prev'] == null
            ? null
            : Prev.fromJson(json['prev'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'totalRecords': totalRecords,
        'pageTotal': pageTotal,
        'next': next?.toJson(),
        'prev': prev?.toJson(),
      };

  Pagination copyWith({
    int? totalRecords,
    int? pageTotal,
    Next? next,
    Prev? prev,
  }) {
    return Pagination(
      totalRecords: totalRecords ?? this.totalRecords,
      pageTotal: pageTotal ?? this.pageTotal,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }

  @override
  List<Object?> get props => [totalRecords, pageTotal, next, prev];
}
