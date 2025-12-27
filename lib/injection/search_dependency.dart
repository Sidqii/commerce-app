import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suaka_niaga/app/features/search/data/repositories/storage_repository_impl.dart';

import 'package:suaka_niaga/app/features/search/domain/repositories/search_repository.dart';
import 'package:suaka_niaga/app/features/search/data/repositories/search_repository_impl.dart';

import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource_impl.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/storage_repository.dart';

import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

extension SearchDependency on GetIt {
  void registerSearch() {
    registerLazySingleton<SearchDatasource>(() {
      return SearchDatasourceImpl(this<Dio>());
    });

    registerLazySingleton<SearchRepository>(() {
      return SearchRepositoryImpl(this<SearchDatasource>());
    });

    registerLazySingleton<StorageRepository>(() {
      return StorageRepositoryImpl(sl<SharedPreferences>());
    });

    registerFactory<SearchCubit>(() {
      return SearchCubit(this<SearchRepository>(), this<StorageRepository>());
    });
  }
}
