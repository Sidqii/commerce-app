import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

abstract class BrowseRepository {
  Future<List<CatalogEntity>> fetchBrowseRepository({
    String? category,
    String? keyword,
    int page = 1,
  });
}
