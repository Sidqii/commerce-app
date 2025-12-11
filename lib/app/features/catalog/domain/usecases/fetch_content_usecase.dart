import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';

class FetchCatalogUsecase {
  final ContentRepository repository;

  const FetchCatalogUsecase(this.repository);

  Future<List<ProductsEntity>> call() {
    return repository.fetchCatalogRepository();
  }
}
