import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:suaka_niaga/app/utils/config/app_env.dart';
import 'package:suaka_niaga/app/utils/config/env_dev.dart';

import 'package:suaka_niaga/app/utils/config/environment.dart';

extension NetworkDependency on GetIt {
  void registerNetwork() {
    // ENVIRONMENT
    registerLazySingleton<AppEnv>(() => DevEnvironment());

    registerLazySingleton<Dio>(() {
      return Dio(
        BaseOptions(
          baseUrl: Environment.current.url,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
    });
  }
}
