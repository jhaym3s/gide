// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:gide/core/services/local_database/abstract_hive.dart';
import 'package:gide/core/services/local_database/hive_keys.dart';

class HiveStorage implements AbstractHive {
  HiveStorage(this.box);
  final Box box;
  @override
  Future<void> put(dynamic key, dynamic value) async {
    await box.put(key, value);
  }

  @override
  T? get<T>(String key) {
    return box.get(key);
  }

  @override
  dynamic getAt(int key) {
    return box.getAt(key);
  }

  @override
  Future<int> add(value) async {
    return await box.add(value);
  }

  @override
  Future<int> clear() async {
    return await box.clear();
  }

  @override
  Future<void> delete(value) async {
    return await box.delete(value);
  }

  @override
  Future<void> putAll(Map<String, dynamic> entries) async {
    return await box.putAll(entries);
  }
}

final localDbProvider =
    Provider<AbstractHive>((ref) => HiveStorage(Hive.box(HiveKeys.appBox)));
