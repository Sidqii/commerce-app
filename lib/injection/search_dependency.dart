import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';

extension SearchDependency on GetIt {
  void registerSearch() {
    registerFactory<SearchCubit>(() => SearchCubit());
  }
}
