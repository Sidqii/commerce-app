import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';

class BrowseFetchUsecase {
  final BrowseRepository repository;

  const BrowseFetchUsecase(this.repository);

  Future<List<CatalogEntity>> call({
    String? keyword,
    String? category,
    String? sorting,
    int? minimal,
    int? maximal,
    int page = 1,
  }) {
    return repository.fetchBrowseRepository(
      keyword: keyword,
      category: category,
      sorting: sorting,
      minimal: minimal,
      maximal: maximal,
      page: page,
    );
  }
}
