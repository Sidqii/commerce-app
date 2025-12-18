import 'package:suaka_niaga/app/features/search/data/model/autocomplete_model.dart';

abstract class SearchDatasource {
  Future<List<AutocompleteModel>> fetchDatasource({
    required String keyword,
    int limit = 5,
  });
}
