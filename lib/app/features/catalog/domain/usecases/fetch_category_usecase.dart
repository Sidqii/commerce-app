import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';
import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';

class FetchCategoryUsecase {
  final ContentRepository repository;

  const FetchCategoryUsecase(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.fetchCategoryRepository();
  }
}
