// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:gide/core/configs/constants.dart';

toastMessage(String text, {bool long = false, Color? color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      backgroundColor: color ?? kPrimaryColor,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white);
}

errorToastMessage(String text, {bool long = false, Color? color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      backgroundColor: color ?? kError,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white);
}
