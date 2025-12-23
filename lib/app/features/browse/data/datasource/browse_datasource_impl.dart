import 'package:dio/dio.dart';
import 'browse_datasource.dart';
import 'package:suaka_niaga/app/utils/data/model/catalog_model.dart';

class BrowseDatasourceImpl implements BrowseDatasource {
  final Dio dio;

  const BrowseDatasourceImpl(this.dio);

  @override
  Future<List<CatalogModel>> fetchBrowseDatsource({
    String? keyword,
    String? category,
    String? sorting,
    int? maximal,
    int? minimal,
    int page = 1,
  }) async {
    final query = <String, String>{};

    if (keyword != null && keyword.trim().isNotEmpty) {
      query['q'] = keyword;
    }

    if (category != null && category.trim().isNotEmpty) {
      query['category.name'] = category;
    }

    if (sorting != null) {
      query['_sort'] = sorting;
    }

    if (maximal != null) {
      query['price_lte'] = maximal.toString();
    }

    if (minimal != null) {
      query['price_gte'] = minimal.toString();
    }

    query['_page'] = page.toString();
    
    query['_limit'] = '20';

    final response = await dio.get('/products');

    final jsonData = response.data;

    if (jsonData is! Map<String, dynamic>) {
      throw Exception('Response data invalid');
    }

    final data = jsonData['products'];

    if (data is! List) {
      throw Exception('Invalid catalog data');
    }

    return data.map((json) => CatalogModel.fromJson(json)).toList();
  }
}
