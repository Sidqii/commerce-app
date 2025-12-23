import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  const SearchRepositoryImpl(this.datasource);

  @override
  Future<List<CatalogEntity>> fetchRepository(String keyword) async {
    final models = await datasource.fetchDatasource(keyword: keyword);

    return models.map((model) => model.toEntity()).toList();
  }
}
