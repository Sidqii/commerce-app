import 'package:suaka_niaga/app/features/catalog/data/datasource/content_datasource.dart';
import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentDatasource datasource;

  ContentRepositoryImpl(this.datasource);

  @override
  Future<List<CatalogEntity>> getCatalogRepository() async {
    final data = await datasource.getCataglogDatasource();

    return data.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<CatalogEntity>> getCategoryRepository() async {
    final request = await datasource.getCataglogDatasource();

    final result = request.map((model) => model.toEntity()).toList();

    final dataset = result.map((e) => e.category).toSet().toList();

    return dataset.map((set) {
      return result.firstWhere((element) => element.category == set);
    }).toList();
  }

  @override
  Future<List<String>> getBannerRepository() async {
    final result = await datasource.getCataglogDatasource();

    final models = result.map((model) => model.toEntity()).toList();

    final images = models.where((element) => element.image.isNotEmpty);

    return images.map((e) => e.image.first).toList();
  }
}
