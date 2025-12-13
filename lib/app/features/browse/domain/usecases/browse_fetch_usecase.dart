import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

class BrowseFetchUsecase {
  final BrowseRepository repository;

  const BrowseFetchUsecase(this.repository);

  Future<List<ProductsEntity>> call({
    String? keyword,
    String? category,
    String? sorting,
    int? minimal,
    int? maximal,
    int? page,
  }) {
    return repository.fetchBrowseRepository();
  }
}
