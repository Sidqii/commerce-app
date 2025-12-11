import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

abstract class ContentDatasource {
  Future<List<ProductsModel>> fetchCatalogDatasource();

  Future<List<String>> fetchBannerDatasource();
}
