// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:gide/core/services/config/interceptor/app_interceptors.dart';
import 'package:gide/core/services/local_database/hive_keys.dart';
import 'package:gide/core/services/local_database/local_db.dart';
import 'package:gide/core/services/network/api_key.dart';
import 'package:gide/core/services/network/rest_client.dart';
import 'package:gide/domain/repositories/user_repository.dart';
import 'package:gide/features/dashboard/profile/data/user_repository_impl.dart';

///? Useful Providers Decleared here !!!

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio();
    dio.options.baseUrl = APIKey.baseUrl;
    dio.options.headers = {
      'Content-Type': 'application/json',
      "accept": 'application/json'
    };
    dio.interceptors.add(
      AppInterceptor(
        dio: dio,
        userRepository:
            UserRepositoryImpl(HiveStorage(Hive.box(HiveKeys.appBox)), ref),
      ),
    );
    return dio;
  },
);

final restClientProvider =
    Provider<RestClient>((ref) => RestClient(ref.read(dioProvider)));

final userRepoProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(localDbProvider), ref),
);

final currentUserProvider =
    StateProvider((ref) => ref.read(userRepoProvider).getProfile());
