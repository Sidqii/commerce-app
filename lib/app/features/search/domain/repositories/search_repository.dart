import 'package:suaka_niaga/app/features/search/domain/entities/autocomplete_entity.dart';

abstract class SearchRepository {
  Future<List<AutocompleteEntity>> fetchRepository(String keyword);
}
