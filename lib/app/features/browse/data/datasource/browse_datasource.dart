import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

abstract class BrowseDatasource {
  Future<List<ProductsModel>> fetchBrowseDatsource({
    String? keyword,
    String? category,
    String? sorting,
    int? maximal,
    int? minimal,
    int page = 1,
  });
}
