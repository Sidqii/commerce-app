part of 'search_bloc.dart';

@immutable
sealed class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchKeywordEvent extends SearchEvent {
  final String keyword;

  const SearchKeywordEvent(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class SearchSubmitEvent extends SearchEvent {
  final String keyword;

  const SearchSubmitEvent(this.keyword);

  @override
  List<Object?> get props => [keyword];
}
