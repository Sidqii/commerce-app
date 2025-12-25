import 'package:dio/dio.dart';
import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource.dart';

class SearchDatasourceImpl implements SearchDatasource {
  final Dio dio;

  const SearchDatasourceImpl(this.dio);

  @override
  Future<List<CatalogModel>> fetchDatasource({required String keyword}) async {
    try {
      final response = await dio.get(
        '/products/search',
        queryParameters: {'q': keyword, 'limit': 5},
      );

      final json = response.data;

      if (json is! Map<String, dynamic>) {
        throw Exception();
      }

      final data = json['products'];

      if (data is! List) {
        throw Exception();
      }

      return data.map((jsonData) => CatalogModel.fromJson(jsonData)).toList();
    } on DioException {
      rethrow;
    }
    
  }
}
