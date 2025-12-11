import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class ContentRepository {
  Future<List<ProductsEntity>> fetchCatalogRepository();

  Future<List<String>> fetchBannerRepository();
}
