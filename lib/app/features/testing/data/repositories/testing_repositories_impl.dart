import 'package:suaka_niaga/app/features/testing/data/datasource/testing_datasources.dart';
import 'package:suaka_niaga/app/features/testing/domain/entities/testing_entity.dart';
import 'package:suaka_niaga/app/features/testing/domain/repositories/testing_repositories.dart';

class TestingRepositoriesImpl implements TestingRepositories {
  final TestingDatasources datasources;

  const TestingRepositoriesImpl(this.datasources);

  @override
  Future<List<TestingEntity>> fetchTestingRepositories() async {
    final result = await datasources.fetchTestingDatasource();

    return result.map((model) => model.toEntity()).toList();
  }
}
