import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suaka_niaga/app/utils/data/model/products_model.dart';
import 'package:suaka_niaga/app/features/sorting/data/datasource/sorting_datasource.dart';

class SortingDatasourceImpl implements SortingDatasource {
  final http.Client client;
  final String baseUrl;

  const SortingDatasourceImpl(this.client, this.baseUrl);

  @override
  Future<List<ProductsModel>> sortingDatasource(String rule) async {
    String sortField = 'pricing.final_price';

    String sortOrder = 'asc';

    switch (rule) {
      case 'price_desc':
        sortField = 'pricing.final_price';
        sortOrder = 'desc';
        break;

      case 'rating_asc':
        sortField = 'rating';
        sortOrder = 'asc';
        break;

      case 'rating_desc':
        sortField = 'rating';
        sortOrder = 'desc';
        break;

      case 'sold_asc':
        sortField = 'sold';
        sortOrder = 'asc';
        break;

      case 'solde_desc':
        sortField = 'sold';
        sortOrder = 'desc';
        break;
    }

    final url = Uri.parse(
      '$baseUrl/products?_sort=$sortField&_order=$sortOrder',
    );

    final response = await client.get(url);

    final data = jsonDecode(response.body) as List;

    return data.map((jsonData) => ProductsModel.fromJson(jsonData)).toList();
  }
}
