import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

class BrowseFetchUsecase {
  final BrowseRepository repository;

  const BrowseFetchUsecase(this.repository);

  Future<List<ProductsEntity>> call() {
    return repository.fetchBrowseRepository();
  }
}
