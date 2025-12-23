import 'package:dio/dio.dart';
import 'package:suaka_niaga/app/features/testing/data/datasource/testing_datasources.dart';
import 'package:suaka_niaga/app/features/testing/data/model/testing_model.dart';

class TestingDatasourcesImpl implements TestingDatasources {
  final Dio dio;

  const TestingDatasourcesImpl(this.dio);

  @override
  Future<List<TestingModel>> fetchTestingDatasource() async {
    try {
      final response = await dio.get('/products');

      final data = response.data;

      if (data is! Map<String, dynamic>) {
        throw Exception('Catalog data invalid');
      }

      final products = data['products'];

      if (products is! List) {
        throw Exception('Products data invalid');
      }

      return products.map((json) => TestingModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Network error');
    }
  }
}
