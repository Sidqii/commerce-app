import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

abstract class BrowseDatasource {
  Future<List<CatalogModel>> fetchBrowseDatsource({
    String? keyword,
    String? category,
    String? sorting,
    int? maximal,
    int? minimal,
    int page = 1,
  });
}
