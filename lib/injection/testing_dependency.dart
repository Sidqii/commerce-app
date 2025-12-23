import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/features/testing/data/datasource/testing_datasources.dart';
import 'package:suaka_niaga/app/features/testing/data/datasource/testing_datasources_impl.dart';
import 'package:suaka_niaga/app/features/testing/data/repositories/testing_repositories_impl.dart';
import 'package:suaka_niaga/app/features/testing/domain/repositories/testing_repositories.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_bloc.dart';

extension TestingDependency on GetIt {
  void registerTesting() {
    registerLazySingleton<TestingDatasources>(() {
      return TestingDatasourcesImpl(this<Dio>());
    });

    registerLazySingleton<TestingRepositories>(() {
      return TestingRepositoriesImpl(this());
    });

    registerFactory(() => TestingBloc(this()));
  }
}
