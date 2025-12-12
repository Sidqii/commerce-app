import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class BrowseRepository {
  Future<List<ProductsEntity>> fetchBrowseRepository({
    String? keyword,
    String? category,
    String? sorting,
    int? minimal,
    int? maximal,
    int page = 1,
  });
}
