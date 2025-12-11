import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_query_datasource.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_query_datasource_impl.dart';

class SearchQueryRepositoryImpl implements SearchQueryDatasource {
  final SearchQueryDatasourceImpl datasource;

  const SearchQueryRepositoryImpl(this.datasource);

  @override
  Future<List<ProductsEntity>> searchQueryDatasource(String? keyword) async {
    final result = await datasource.searchQueryDatasource(keyword);

    final data = result.map((datasource) => datasource.toEntity()).toList();

    return data;
  }
}
