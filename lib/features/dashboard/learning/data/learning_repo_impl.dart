// Dart imports:

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/app_exception.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/core/services/network/rest_client.dart';
import 'package:gide/domain/model_response/create_enrollment_resp/create_enrollment_resp.dart';
import 'package:gide/domain/model_response/create_review.dart';
import 'package:gide/domain/repositories/learning_repo.dart';
import 'package:gide/features/dashboard/learning/model/create_enrollment.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enrollment_model.dart';

class LearningImpl extends LearningRepo {
  final RestClient _client;

  LearningImpl(
    this._client,
  );

  @override
  Future<BaseResponse<CreateEnrollmentResp>> createEnrollment(
      {CreateEnrollment? createEnrollment}) async {
    try {
      final resp = await _client.createEnrollment(createEnrollment!);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse<EnrollmentModel>> getEnrollment() async {
    try {
      final resp = await _client.getEnrollment();
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse> review( CreateReview createReview) async {
    try {
      final resp = await _client.createReview(createReview);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }
}

final enrollRroviderImpl = Provider(
  (ref) => LearningImpl(
    ref.read(restClientProvider),
  ),
);
