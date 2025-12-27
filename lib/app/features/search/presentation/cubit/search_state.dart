part of 'search_cubit.dart';

enum SearchStatus { idle, loaded, empty, error }

class SearchState {
  final String keyword;
  final SearchStatus status;
  final List<String> storage;
  final List<CatalogEntity> autocomplete;

  const SearchState({
    this.keyword = '',
    this.status = SearchStatus.idle,
    this.storage = const [],
    this.autocomplete = const [],
  });

  SearchState copyWith({
    String? keyword,
    SearchStatus? status,
    List<String>? storage,
    List<CatalogEntity>? autocomplete,
  }) {
    return SearchState(
      keyword: keyword ?? this.keyword,
      status: status ?? this.status,
      storage: storage ?? this.storage,
      autocomplete: autocomplete ?? this.autocomplete,
    );
  }
}
