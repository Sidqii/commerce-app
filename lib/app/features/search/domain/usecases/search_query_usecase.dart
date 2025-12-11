import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_query_repository.dart';

class SearchQueryUsecase {
  SearchQueryRepository repository;

  SearchQueryUsecase(this.repository);

  Future<List<ProductsEntity>> call(String? keyword) {
    return repository.searchQueryRepository(keyword);
  }
}
