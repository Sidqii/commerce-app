import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource_impl.dart';
import 'package:suaka_niaga/app/features/search/data/repositories/search_repository_impl.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_repository.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';
import 'package:suaka_niaga/app/utils/config/app_env.dart';

extension SearchDependency on GetIt {
  void registerSearch() {
    registerLazySingleton<Dio>(() {
      final env = this<AppEnv>();

      return Dio(BaseOptions(baseUrl: env.url));
    });

    registerLazySingleton<SearchDatasource>(() {
      return SearchDatasourceImpl(this());
    });

    registerLazySingleton<SearchRepository>(() {
      return SearchRepositoryImpl(this());
    });

    registerFactory<SearchCubit>(() => SearchCubit(this()));
  }
}
