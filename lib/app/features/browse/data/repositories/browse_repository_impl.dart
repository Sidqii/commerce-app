import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/browse/data/datasource/browse_datasource.dart';
import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';

class BrowseRepositoryImpl implements BrowseRepository {
  final BrowseDatasource datasource;

  const BrowseRepositoryImpl(this.datasource);

  @override
  Future<List<CatalogEntity>> fetchBrowseRepository({
    String? keyword,
    String? category,
    String? sorting,
    int? minimal,
    int? maximal,
    int page = 1,
  }) async {
    final result = await datasource.fetchBrowseDatsource(
      keyword: keyword,
      category: category,
      sorting: sorting,
      minimal: minimal,
      maximal: maximal,
      page: page,
    );

    final data = result.map((model) => model.toEntity()).toList();

    return data;
  }
}
