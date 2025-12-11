import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class SearchQueryDatasource {
  Future<List<ProductsEntity>> searchQueryDatasource(String? keyword);
}
