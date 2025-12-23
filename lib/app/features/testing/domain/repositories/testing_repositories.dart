import 'package:suaka_niaga/app/features/testing/domain/entities/testing_entity.dart';

abstract class TestingRepositories {
  Future<List<TestingEntity>> fetchTestingRepositories();
}
