import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';

class BrowseFetchUsecase {
  final BrowseRepository repository;

  const BrowseFetchUsecase(this.repository);

  Future<List<CatalogEntity>> call({
    String? category,
    String? keyword,
    int page = 1,
  }) {
    return repository.fetchBrowseRepository(
      category: category,
      keyword: keyword,
      page: page,
    );
  }
}
