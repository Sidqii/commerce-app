part of 'search_cubit.dart';

enum SearchStatus { idle, loading, loaded, empty, error }

class SearchState {
  final String keyword;
  final SearchStatus status;
  final List<AutocompleteEntity> autocomplete;

  const SearchState({
    this.keyword = '',
    this.status = SearchStatus.idle,
    this.autocomplete = const [],
  });

  SearchState copyWith({
    String? keyword,
    SearchStatus? status,
    List<AutocompleteEntity>? autocomplete,
  }) {
    return SearchState(
      keyword: keyword ?? this.keyword,
      status: status ?? this.status,
      autocomplete: autocomplete ?? this.autocomplete,
    );
  }
}
