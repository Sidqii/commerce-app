import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/filtering/domain/repositories/filtering_repository.dart';

class FilteringUsecase {
  final FilteringRepository repository;

  const FilteringUsecase(this.repository);

  Future<List<ProductsEntity>> call(
    String? category,
    String? brand,
    int? minPrice,
    int? maxPrice,
  ) {
    return repository.filterCatalogRepository(
      category,
      brand,
      minPrice,
      maxPrice,
    );
  }
}
