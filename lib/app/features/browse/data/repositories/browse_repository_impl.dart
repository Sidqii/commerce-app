import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/browse/data/datasource/browse_datasource.dart';
import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';

class BrowseRepositoryImpl implements BrowseRepository {
  final BrowseDatasource datasource;

  const BrowseRepositoryImpl(this.datasource);

  @override
  Future<List<CatalogEntity>> fetchBrowseRepository({
    String? category,
    String? keyword,
    int page = 1,
  }) async {
    final result = await datasource.fetchBrowseDatsource(
      category: category,
      keyword: keyword,
      page: page,
    );

    final data = result.map((model) => model.toEntity()).toList();

    return data;
  }
}
