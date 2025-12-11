import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class FilteringRepository {
  Future<List<ProductsEntity>> filterCatalogRepository(
    String? category,
    String? brand,
    int? minimalPrice,
    int? maximalPrice,
  );
}
