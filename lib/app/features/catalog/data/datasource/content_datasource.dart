import 'package:suaka_niaga/app/utils/data/model/category_model.dart';
import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

abstract class ContentDatasource {
  Future<List<ProductsModel>> fetchCatalogDatasource();

  Future<List<CategoryModel>> fetchCategoryDatasource();

  Future<List<String>> fetchBannerDatasource();
}
