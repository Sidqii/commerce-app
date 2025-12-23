import 'package:suaka_niaga/app/features/testing/data/model/testing_model.dart';

abstract class TestingDatasources {
  Future<List<TestingModel>> fetchTestingDatasource();
}
