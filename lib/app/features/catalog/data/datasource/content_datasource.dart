import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

abstract class ContentDatasource {
  Future<List<CatalogModel>> getCataglogDatasource();
}
