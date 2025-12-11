part of 'search_bloc.dart';

@immutable
sealed class SearchState extends Equatable {
  const SearchState();
}

class SearchInitialState extends SearchState {
  const SearchInitialState();

  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {
  const SearchLoadingState();

  @override
  List<Object?> get props => [];
}

class SearchKeywordState extends SearchState {
  final String keyword;

  const SearchKeywordState(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class SearchDataState extends SearchState {
  final List<ProductsEntity> product;

  const SearchDataState(this.product);

  @override
  List<Object?> get props => [product];
}

class SearchEmptyState extends SearchState {
  final String message;

  const SearchEmptyState(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
