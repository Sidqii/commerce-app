import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suaka_niaga/app/features/browse/data/datasource/browse_datasource.dart';
import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

class BrowseDatasourceImpl implements BrowseDatasource {
  final http.Client client;
  final String baseUrl;

  const BrowseDatasourceImpl(this.client, this.baseUrl);

  @override
  Future<List<ProductsModel>> fetchBrowseDatsource({
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

    if (category != null) {
      query['category'] = category;
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

    final url = Uri.parse(
      baseUrl,
    ).replace(path: '/products', queryParameters: query);

    final response = await client.get(url);

    final data = jsonDecode(response.body) as List;

    return data.map((jsonData) => ProductsModel.fromJson(jsonData)).toList();
  }
}
