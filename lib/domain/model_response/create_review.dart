// Package imports:
import 'package:equatable/equatable.dart';

class CreateReview extends Equatable {
  final String? comment;
  final int? starRating;
  final String? enrollment;

  const CreateReview({this.comment, this.starRating, this.enrollment});

  factory CreateReview.fromJson(Map<String, dynamic> json) => CreateReview(
        comment: json['comment'] as String?,
        starRating: json['starRating'] as int?,
        enrollment: json['enrollment'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'starRating': starRating,
        'enrollment': enrollment,
      };

  @override
  List<Object?> get props => [comment, starRating, enrollment];
}
