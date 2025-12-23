import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

abstract class BrowseRepository {
  Future<List<CatalogEntity>> fetchBrowseRepository({
    String? keyword,
    String? category,
    String? sorting,
    int? minimal,
    int? maximal,
    int page = 1,
  });
}
