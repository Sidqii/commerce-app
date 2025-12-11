import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class SearchQueryRepository {
  Future<List<ProductsEntity>> searchQueryRepository(String keyword);
}
