import 'package:dio/dio.dart';
import 'content_datasource.dart';

import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

class ContentDatasourceImpl implements ContentDatasource {
  final Dio dio;

  const ContentDatasourceImpl(this.dio);

  @override
  Future<List<CatalogModel>> getCataglogDatasource() async {
    final response = await dio.get('/products');

    final jsonData = response.data;

    if (jsonData is! Map<String, dynamic>) {
      throw Exception('Response catalog invalid');
    }

    final data = jsonData['products'];

    if (data is! List) {
      throw Exception('Invalid catalog data');
    }

    return data.map((json) => CatalogModel.fromJson(json)).toList();
  }
}
