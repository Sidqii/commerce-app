import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suaka_niaga/app/utils/data/model/products_model.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_query_datasource.dart';

class SearchQueryDatasourceImpl implements SearchQueryDatasource {
  final http.Client client;
  final String baseUrl;

  const SearchQueryDatasourceImpl(this.client, this.baseUrl);

  @override
  Future<List<ProductsModel>> searchQueryDatasource(String? keyword) async {
    final url = Uri.parse('$baseUrl/products?q=$keyword');

    final response = await client.get(url);

    final data = jsonDecode(response.body) as List;

    return data.map((jsonData) => ProductsModel.fromJson(jsonData)).toList();
  }
}
