import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/sorting/domain/repositories/sorting_repository.dart';

class SortingUsecase {
  final SortingRepository repository;

  SortingUsecase(this.repository);

  Future<List<ProductsEntity>> call(String rule) {
    return repository.sortingRepository(rule);
  }
}
