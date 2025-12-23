import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/features/catalog/data/datasource/content_datasource.dart';
import 'package:suaka_niaga/app/features/catalog/data/datasource/content_datasource_impl.dart';

import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';
import 'package:suaka_niaga/app/features/catalog/data/repositories/content_repository_impl.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/bloc/content_bloc.dart';

extension CatalogDependency on GetIt {
  void registerCatalog() {
    // REGISTER DATASOURCE + URL
    registerLazySingleton<ContentDatasource>(() {
      return ContentDatasourceImpl(this<Dio>());
    });

    // REGISTER REPOSITORY
    registerLazySingleton<ContentRepository>(() {
      return ContentRepositoryImpl(this<ContentDatasource>());
    });

    // REGISTER BLoC
    registerFactory(() => ContentBloc(this<ContentRepository>()));
  }
}
