import 'package:equatable/equatable.dart';

class CourseLength extends Equatable {
  final int? hours;
  final int? minutes;

  const CourseLength({this.hours, this.minutes});

  factory CourseLength.fromJson(Map<String, dynamic> json) => CourseLength(
        hours: json['hours'] as int?,
        minutes: json['minutes'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'hours': hours,
        'minutes': minutes,
      };

  CourseLength copyWith({
    int? hours,
    int? minutes,
  }) {
    return CourseLength(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
    );
  }

  @override
  List<Object?> get props => [hours, minutes];
}
