import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:suaka_niaga/app/utils/config/app_env.dart';
import 'package:suaka_niaga/app/utils/config/env_dev.dart';

extension NetworkDependency on GetIt {
  void registerNetwork() {
    // HTTP Client
    registerLazySingleton<http.Client>(() => http.Client());

    // ENVIRONMENT
    registerLazySingleton<AppEnv>(() => DevEnvironment());
  }
}
