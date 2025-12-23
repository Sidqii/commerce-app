part of 'browse_bloc.dart';

sealed class BrowseEvent extends Equatable {
  const BrowseEvent();

  @override
  List<Object?> get props => [];
}

class BrowseFetchEvent extends BrowseEvent {}

class BrowseLoadEvent extends BrowseEvent {}

class BrowseFilterEvent extends BrowseEvent {
  final String? category;
  final String? keyword;

  const BrowseFilterEvent(this.category, this.keyword);

  @override
  List<Object?> get props => [category, keyword];
}

class BrowseRetryEvent extends BrowseEvent {}
