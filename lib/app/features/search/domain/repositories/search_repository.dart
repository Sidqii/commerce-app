import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

abstract class SearchRepository {
  Future<List<CatalogEntity>> fetchRepository(String keyword);
}
