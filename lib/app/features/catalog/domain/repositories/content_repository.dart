import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

abstract class ContentRepository {
  Future<List<CatalogEntity>> getCatalogRepository();

  Future<List<CatalogEntity>> getCategoryRepository();

  Future<List<String>> getBannerRepository();
}
