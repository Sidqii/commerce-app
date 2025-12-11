import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suaka_niaga/app/utils/data/model/products_model.dart';
import 'package:suaka_niaga/app/features/filtering/data/datasource/filtering_datasource.dart';

class FilteringDatasourceImpl implements FilteringDatasource {
  final http.Client client;
  final String baseUrl;

  const FilteringDatasourceImpl(this.client, this.baseUrl);

  @override
  Future<List<ProductsModel>> filteringDatasource(
    String? category,
    String? brand,
    int? minimalPrice,
    int? maximalPrice,
  ) async {
    final parameter = <String, String>{};

    if (category != null && category.isNotEmpty) {
      parameter['category.name'] = category;
    }

    if (brand != null && brand.isNotEmpty) {
      parameter['brand.name'] = brand;
    }

    if (minimalPrice != null) {
      parameter['pricing.final_price_gte'] = minimalPrice.toString();
    }

    if (maximalPrice != null) {
      parameter['pricing.final_price_lte'] = maximalPrice.toString();
    }

    final url = Uri.parse(
      '$baseUrl/products',
    ).replace(queryParameters: parameter);

    final response = await client.get(url);

    final data = jsonDecode(response.body) as List;

    return data.map((jsonData) => ProductsModel.fromJson(jsonData)).toList();
  }
}
