import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

abstract class SearchQueryDatasource {
  Future<List<ProductsModel>> searchQueryDatasource(String keyword);
}
