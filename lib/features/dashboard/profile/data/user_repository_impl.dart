// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/core/services/local_database/abstract_hive.dart';
import 'package:gide/core/services/local_database/hive_keys.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/dashboard/profile/model/profile.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._storage, this._ref);

  final AbstractHive _storage;
  final Ref _ref;

  @override
  void saveCurrentState(CurrentState val) async {
    await _storage.put(HiveKeys.currentState, val.name);
  }

  @override
  CurrentState getCurrentState() {
    switch (_storage.get(HiveKeys.currentState) ?? CurrentState.initial.name) {
      case "loggedIn":
        return CurrentState.loggedIn;
      case "onboarded":
        return CurrentState.onboarded;
      default:
        return CurrentState.initial;
    }
  }

  @override
  void saveToken(String val) async {
    await _storage.put(HiveKeys.token, val);
  }

  @override
  String getToken() {
    return _storage.get(HiveKeys.token) ?? "";
  }

  @override
  bool hasClearedCache() {
    return _storage.get(HiveKeys.clearedCache) ?? false;
  }

  @override
  void saveCacheStatus(bool status) async {
    await _storage.put(HiveKeys.clearedCache, status);
  }

  @override
  void saveProfile(Profile profile) async {
    await _storage.put(HiveKeys.user, json.encode(profile));
  }

  @override
  void setCurrentProfile(Profile profile) {
    _ref.read(currentUserProvider.notifier).state = profile;
    saveProfile(profile);
  }

  @override
  Profile getProfile() {
    final response = _storage.get(HiveKeys.user) ?? {};
    Profile profile = Profile.fromJson(
        response is String ? json.decode(response) : json.decode('$response'));

    return profile;
  }
}

//? Please check configure_dependencies.dart file to locate useful providers
