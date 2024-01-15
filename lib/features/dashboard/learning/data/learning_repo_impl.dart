// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/config/exception/app_exception.dart';
import 'package:gide/core/services/config/response/base_response.dart';
import 'package:gide/core/services/network/api_key.dart';
import 'package:gide/core/services/network/rest_client.dart';
import 'package:gide/core/services/network/upload_file_services.dart';
import 'package:gide/domain/model_response/create_enrollment_resp/create_enrollment_resp.dart';
import 'package:gide/domain/model_response/instructor_resp.dart';
import 'package:gide/domain/model_response/upload_file_resp.dart';
import 'package:gide/domain/repositories/learning_repo.dart';
import 'package:gide/domain/repositories/profile_repo.dart';
import 'package:gide/features/dashboard/learning/model/create_enrollment.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enrollment_model.dart';
import 'package:gide/features/dashboard/profile/become_instructor_model.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/features/dashboard/profile/model/profile.dart';

class LearningImpl extends LearningRepo {
  final RestClient _client;

  LearningImpl(
    this._client,
  );

  @override
  Future<BaseResponse<Profile>> updatePhone(
      PhoneNumerModel phoneNumerModel) async {
    try {
      final resp = await _client.updatePhoneNumber(phoneNumerModel);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse<InstructorResp>> becomeInstructor(
      BecomeInstructorModel becomeInstructorModel) async {
    try {
      final resp = await _client.becomeAnInstructor(becomeInstructorModel);
      return resp;
    } on DioException catch (ex) {
      throw AppException.handleError(ex);
    }
  }

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
}

final enrollRroviderImpl = Provider(
  (ref) => LearningImpl(
    ref.read(restClientProvider),
  ),
);
