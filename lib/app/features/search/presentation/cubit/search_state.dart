part of 'search_cubit.dart';

class SearchState extends Equatable {
  final String keyword;

  const SearchState({this.keyword = ''});

  @override
  List<Object?> get props => [keyword];
}
