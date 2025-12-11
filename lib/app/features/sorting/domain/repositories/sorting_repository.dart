import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

abstract class SortingRepository {
  Future<List<ProductsEntity>> sortingRepository(String rule);
}
