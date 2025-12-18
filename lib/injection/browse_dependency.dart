import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/utils/config/app_env.dart';
import 'package:suaka_niaga/app/features/browse/data/datasource/browse_datasource.dart';
import 'package:suaka_niaga/app/features/browse/data/datasource/browse_datasource_impl.dart';
import 'package:suaka_niaga/app/features/browse/data/repositories/browse_repository_impl.dart';
import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';
import 'package:suaka_niaga/app/features/browse/domain/usecases/browse_fetch_usecase.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';

extension BrowseDependency on GetIt {
  void registerBrowse() {
    // REGISTER DATASOURCE + URL
    registerLazySingleton<BrowseDatasource>(() {
      return BrowseDatasourceImpl(this(), this<AppEnv>().url);
    });

    // REGISTER REPOSITORY
    registerLazySingleton<BrowseRepository>(() {
      return BrowseRepositoryImpl(this());
    });

    // REGISTER USECASE
    registerLazySingleton(() => BrowseFetchUsecase(this()));

    // REGISTER BLoC
    registerFactory(() {
      return BrowseBloc(onFetchUsecase: this());
    });
  }
}
