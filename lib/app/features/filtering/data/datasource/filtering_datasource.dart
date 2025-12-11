import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

abstract class FilteringDatasource {
  Future<List<ProductsModel>> filteringDatasource(
    String? category,
    String? brand,
    int? minimalPrice,
    int? maximalPrice,
  );
}
