// Package imports:
import 'package:equatable/equatable.dart';

class Length extends Equatable {
  final int? hours;
  final int? minutes;

  const Length({this.hours, this.minutes});

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        hours: json['hours'] as int?,
        minutes: json['minutes'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'hours': hours,
        'minutes': minutes,
      };

  Length copyWith({
    int? hours,
    int? minutes,
  }) {
    return Length(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
    );
  }

  @override
  List<Object?> get props => [hours, minutes];
}
