import 'package:dio/dio.dart';
import 'package:suaka_niaga/app/features/search/data/datasource/search_datasource.dart';
import 'package:suaka_niaga/app/features/search/data/model/autocomplete_model.dart';

class SearchDatasourceImpl implements SearchDatasource {
  final Dio dio;

  const SearchDatasourceImpl(this.dio);
  @override
  Future<List<AutocompleteModel>> fetchDatasource({
    required String keyword,
    int limit = 5,
  }) async {
    final response = await dio.get(
      '/search_suggestions',
      queryParameters: {'q': keyword, '_limit': limit},
    );

    final List data = response.data as List;

    return data.map((jsonData) {
      return AutocompleteModel.fromJson(jsonData as Map<String, dynamic>);
    }).toList();
  }
}
