import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/features/catalog/data/datasource/content_datasource.dart';
import 'package:suaka_niaga/app/features/catalog/data/datasource/content_datasource_impl.dart';
import 'package:suaka_niaga/app/features/catalog/data/repositories/content_repository_impl.dart';
import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';
import 'package:suaka_niaga/app/features/catalog/domain/usecases/fetch_banner_usecase.dart';
import 'package:suaka_niaga/app/features/catalog/domain/usecases/fetch_content_usecase.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/bloc/content_bloc.dart';
import 'package:suaka_niaga/app/utils/config/environment.dart';

extension CatalogDependency on GetIt {
  void registerCatalog() {
    // REGISTER DATASOURCE + URL
    registerLazySingleton<ContentDatasource>(() {
      return ContentDatasourceImpl(this(), Environment.current.url);
    });

    // REGISTER REPOSITORY
    registerLazySingleton<ContentRepository>(() {
      return ContentRepositoryImpl(this());
    });

    // REGISTER REPOSSITORY
    registerLazySingleton(() => FetchCatalogUsecase(this()));
    registerLazySingleton(() => FetchBannerUsecase(this()));

    // REGISTER BLoC
    registerFactory(() {
      return ContentBloc(
        usecasesFetchCatalog: this(),
        usecasesFetchBanner: this(),
      );
    });
  }
}
