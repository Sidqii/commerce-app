import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/filtering/data/datasource/filtering_datasource.dart';
import 'package:suaka_niaga/app/features/filtering/domain/repositories/filtering_repository.dart';

class FilteringRepositoryImpl implements FilteringRepository {
  final FilteringDatasource datasource;

  const FilteringRepositoryImpl(this.datasource);

  @override
  Future<List<ProductsEntity>> filterCatalogRepository(
    String? category,
    String? brand,
    int? minimalPrice,
    int? maximalPrice,
  ) async {
    final result = await datasource.filteringDatasource(
      category,
      brand,
      minimalPrice,
      maximalPrice,
    );

    final entity = result.map((datasource) => datasource.toEntity()).toList();

    return entity;
  }
}
