import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class ContentRepository {
  Future<List<ProductsEntity>> fetchCatalogRepository();

  Future<List<CategoryEntity>> fetchCategoryRepository();

  Future<List<String>> fetchBannerRepository();
}
