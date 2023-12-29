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
import 'package:gide/domain/model_response/instructor_resp.dart';
import 'package:gide/domain/model_response/upload_file_resp.dart';
import 'package:gide/domain/repositories/profile_repo.dart';
import 'package:gide/features/dashboard/profile/become_instructor_model.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/features/dashboard/profile/profile/profile.dart';

class ProfileImpl extends ProfileRepo {
  final RestClient _client;

  ProfileImpl(this._client, this._reader);
  final UploadFileApiServices fileApiServices = UploadFileApiServices();
  final Ref _reader;

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
  Future<BaseResponse<Profile>> getProfile() async {
    try {
      final resp = await _client.getProfile();
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse> changePasswd(
      ChangePasswordModel changePasswordModel) async {
    try {
      final resp = await _client.changePass(changePasswordModel);
      return resp;
    } on DioException catch (ex) {
      return AppException.handleError(ex);
    }
  }

  @override
  Future<BaseResponse<UploadFileResp>> uploadFile(File file) async {
    final dio = _reader.read(dioProvider);
    try {
      // final resp = await _client.uploadFiles(file);
      final resp = await fileApiServices.uploadFiles(file, dio, APIKey.baseUrl);
      return resp;
    } on DioException catch (ex) {
      throw AppException.handleError(ex);
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
}

final profileRepoProv =
    Provider((ref) => ProfileImpl(ref.read(restClientProvider), ref));
