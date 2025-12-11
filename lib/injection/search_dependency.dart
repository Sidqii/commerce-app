import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_query_datasource.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_query_datasource_impl.dart';
import 'package:suaka_niaga/app/features/search/data/repositories/search_query_repository_impl.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_query_repository.dart';
import 'package:suaka_niaga/app/features/search/domain/usecases/search_query_usecase.dart';
import 'package:suaka_niaga/app/features/search/presentation/bloc/search_bloc.dart';
import 'package:suaka_niaga/app/utils/config/environment.dart';

extension SearchDependency on GetIt {
  void registerSearchKeyword() {
    registerLazySingleton<SearchQueryDatasource>(() {
      return SearchQueryDatasourceImpl(this(), Environment.current.url);
    });

    registerLazySingleton<SearchQueryRepository>(() {
      return SearchQueryRepositoryImpl(this());
    });

    registerLazySingleton(() => SearchQueryUsecase(this()));

    registerFactory(() {
      return SearchBloc(searchQueryUsecase: this());
    });
  }
}
