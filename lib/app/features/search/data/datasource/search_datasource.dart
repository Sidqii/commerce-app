import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

abstract class SearchDatasource {
  Future<List<CatalogModel>> fetchDatasource({required String keyword});
}
