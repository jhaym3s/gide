// Dart imports:
import 'dart:developer';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/helpers/helper_fxn.dart';

class AppFilePicker {
  Future<void> pickFile({
    required ValueNotifier<List<File>> files,
  }) async {
    try {
      final FilePickerResult? pickedFile =
          await FilePicker.platform.pickFiles(type: FileType.any);
      if (pickedFile != null) {
        files.value = [...files.value, File(pickedFile.files.single.path!)];
      } else {
        log('Value after been cancelled $pickedFile');
      }
    } catch (e) {
      log('File exceptionn messages: $e');
      errorToastMessage(e.toString(), long: true);
      return;
    }
  }

  Future<void> pickMultiFile(
      {required ValueNotifier<List<File>> files,
      required FileType? fileType}) async {
    try {
      final FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // withData: true,
          dialogTitle: 'Select Multiple File ChuksDev',
          type: fileType ?? FileType.any);

      if (pickedFiles != null) {
        final newList = [
          ...files.value.length > 8
              ? pickedFiles.paths.map((e) => File(e!)).take(7).toList()
              : pickedFiles.paths.map((e) => File(e!)).toList()
        ];
        files.value = [...files.value, ...newList];
      } else {
        log('Value after been cancelled $pickedFiles');
      }
    } catch (e) {
      log('File exceptionn messages: $e');
      errorToastMessage(e.toString(), long: true);
      return;
    }
  }
}

final filePickerProvider = Provider((_) => AppFilePicker());
