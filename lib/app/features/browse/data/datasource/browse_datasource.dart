import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

abstract class BrowseDatasource {
  Future<List<CatalogModel>> fetchBrowseDatsource({
    String? category,
    String? keyword,
    int page = 1,
  });
}
