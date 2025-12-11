import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

abstract class SortingDatasource {
  Future<List<ProductsModel>> sortingDatasource(String rule);
}
