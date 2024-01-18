// Package imports:
import 'package:equatable/equatable.dart';

class Progress extends Equatable {
  final int? percentageCompleted;
  final int? totalModulesCompleted;
  final int? totalLessonsCompleted;

  const Progress({
    this.percentageCompleted,
    this.totalModulesCompleted,
    this.totalLessonsCompleted,
  });

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        percentageCompleted: json['percentageCompleted'] as int?,
        totalModulesCompleted: json['totalModulesCompleted'] as int?,
        totalLessonsCompleted: json['totalLessonsCompleted'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'percentageCompleted': percentageCompleted,
        'totalModulesCompleted': totalModulesCompleted,
        'totalLessonsCompleted': totalLessonsCompleted,
      };

  Progress copyWith({
    int? percentageCompleted,
    int? totalModulesCompleted,
    int? totalLessonsCompleted,
  }) {
    return Progress(
      percentageCompleted: percentageCompleted ?? this.percentageCompleted,
      totalModulesCompleted:
          totalModulesCompleted ?? this.totalModulesCompleted,
      totalLessonsCompleted:
          totalLessonsCompleted ?? this.totalLessonsCompleted,
    );
  }

  @override
  List<Object?> get props {
    return [
      percentageCompleted,
      totalModulesCompleted,
      totalLessonsCompleted,
    ];
  }
}
