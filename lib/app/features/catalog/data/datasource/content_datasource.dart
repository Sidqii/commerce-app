import 'package:suaka_niaga/app/features/catalog/data/model/catalog_model.dart';

abstract class ContentDatasource {
  Future<List<CatalogModel>> getCataglogDatasource();
}
