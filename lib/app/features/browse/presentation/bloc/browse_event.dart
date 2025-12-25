part of 'browse_bloc.dart';

sealed class BrowseEvent extends Equatable {
  const BrowseEvent();

  @override
  List<Object?> get props => [];
}

class BrowseFetchEvent extends BrowseEvent {
  final String? category;
  final String? keyword;

  const BrowseFetchEvent(this.category, this.keyword);

  @override
  List<Object?> get props => [category, keyword];
}

class BrowseLoadEvent extends BrowseEvent {}
