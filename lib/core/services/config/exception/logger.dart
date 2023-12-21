// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

void debugLog(dynamic data) {
  if (kDebugMode) {
    log("[DEGUBG] $data");
  }
}
