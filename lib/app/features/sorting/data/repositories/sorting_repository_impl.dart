import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/sorting/data/datasource/sorting_datasource.dart';
import 'package:suaka_niaga/app/features/sorting/domain/repositories/sorting_repository.dart';

class SortingRepositoryImpl implements SortingRepository {
  final SortingDatasource datasource;

  const SortingRepositoryImpl(this.datasource);

  @override
  Future<List<ProductsEntity>> sortingRepository(String rule) async {
    final result = await datasource.sortingDatasource(rule);

    final data = result.map((datasource) => datasource.toEntity()).toList();

    return data;
  }
}
