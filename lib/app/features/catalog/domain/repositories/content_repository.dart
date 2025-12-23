import 'package:suaka_niaga/app/features/catalog/domain/entities/catalog_entity.dart';

abstract class ContentRepository {
  Future<List<CatalogEntity>> getCatalogRepository();

  Future<List<CatalogEntity>> getCategoryRepository();

  Future<List<String>> getBannerRepository();
}
