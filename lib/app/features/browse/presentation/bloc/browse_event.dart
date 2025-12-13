part of 'browse_bloc.dart';

sealed class BrowseEvent extends Equatable {
  const BrowseEvent();
}

class BrowseFetchEvent extends BrowseEvent {
  final String? keyword;
  final String? category;
  final String? sorting;
  final int? maximal;
  final int? minimal;
  final int page;

  const BrowseFetchEvent({
    this.keyword,
    this.category,
    this.sorting,
    this.maximal,
    this.minimal,
    this.page = 1,
  });

  @override
  List<Object?> get props => [
    keyword,
    category,
    sorting,
    maximal,
    minimal,
    page,
  ];
}
