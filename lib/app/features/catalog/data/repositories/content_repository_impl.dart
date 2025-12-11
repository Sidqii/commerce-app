import 'package:suaka_niaga/app/features/catalog/data/datasource/content_datasource.dart';
import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentDatasource datasource;

  ContentRepositoryImpl(this.datasource);

  @override
  Future<List<ProductsEntity>> fetchCatalogRepository() async {
    final data = await datasource.fetchCatalogDatasource();

    final catalog = data.map((datasource) => datasource.toEntity()).toList();

    return catalog;
  }

  @override
  Future<List<CategoryEntity>> fetchCategoryRepository() async {
    final data = await datasource.fetchCategoryDatasource();

    final category = data.map((datasource) => datasource.toEntity()).toList();

    return category;
  }

  @override
  Future<List<String>> fetchBannerRepository() async {
    final data = await datasource.fetchBannerDatasource();

    final banner = data.map((datasource) => datasource.toString()).toList();

    return banner;
  }
}
