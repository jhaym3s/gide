// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> extends Equatable {
  final T? data;
  @JsonKey(name: "code")
  final int? statusCode;
  @JsonKey(name: "success")
  final bool? status;
  final String? message;
  final String? returnStatus;

  const BaseResponse({
    this.data,
    this.statusCode,
    this.message,
    this.status,
    this.returnStatus,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
        data: json['data'],
        statusCode: json['code'] ?? 100,
        message: json['message'] ?? 'An error occured',
        returnStatus: json['returnStatus'] ?? 'UNAUTHORIZED',
        status: json['success'] ?? false);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [statusCode, message, data];
}
