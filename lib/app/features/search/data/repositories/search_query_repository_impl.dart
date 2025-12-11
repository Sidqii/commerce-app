import 'package:suaka_niaga/app/features/search/data/datasource/search_query_datasource.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_query_repository.dart';

class SearchQueryRepositoryImpl implements SearchQueryRepository {
  final SearchQueryDatasource datasource;

  const SearchQueryRepositoryImpl(this.datasource);

  @override
  Future<List<ProductsEntity>> searchQueryRepository(String keyword) async {
    final response = await datasource.searchQueryDatasource(keyword);

    final data = response.map((model) => model.toEntity()).toList();

    return data;
  }
}
