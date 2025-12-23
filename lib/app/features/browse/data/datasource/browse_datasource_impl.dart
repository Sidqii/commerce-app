import 'package:dio/dio.dart';
import 'browse_datasource.dart';
import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

class BrowseDatasourceImpl implements BrowseDatasource {
  static const int pageSize = 10;
  final Dio dio;

  const BrowseDatasourceImpl(this.dio);

  @override
  Future<List<CatalogModel>> fetchBrowseDatsource({
    String? category,
    String? keyword,
    int page = 1,
  }) async {
    final skip = (page - 1) * pageSize;

    String endpoint = '/products';

    final query = <String, dynamic>{'limit': pageSize, 'skip': skip};

    if (category != null && category.isNotEmpty) {
      endpoint = '/products/category/$category';
    } else if (keyword != null && keyword.isNotEmpty) {
      endpoint = '/products/search';
      query['q'] = keyword;
    }

    final response = await dio.get(endpoint, queryParameters: query);

    final jsonData = response.data;

    if (jsonData is! Map<String, dynamic>) {
      throw Exception('Response data invalid');
    }

    final data = jsonData['products'];

    if (data is! List) {
      throw Exception('Invalid data catalog');
    }

    return data.map((json) => CatalogModel.fromJson(json)).toList();
  }
}
