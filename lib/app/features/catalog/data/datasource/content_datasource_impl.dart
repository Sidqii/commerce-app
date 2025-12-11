import 'dart:convert';
import 'content_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:suaka_niaga/app/utils/data/model/products_model.dart';

class ContentDatasourceImpl implements ContentDatasource {
  final http.Client client;
  final String base;

  const ContentDatasourceImpl(this.client, this.base);

  @override
  Future<List<ProductsModel>> fetchCatalogDatasource() async {
    final response = await client.get(Uri.parse('$base/products'));

    final data = jsonDecode(response.body) as List;

    return data.map((jsonData) => ProductsModel.fromJson(jsonData)).toList();
  }

  @override
  Future<List<String>> fetchBannerDatasource() async {
    final response = await client.get(Uri.parse('$base/banner'));

    if (response.statusCode != 200) {
      throw Exception('API error');
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((jsonData) => jsonData.toString()).toList();
  }
}
