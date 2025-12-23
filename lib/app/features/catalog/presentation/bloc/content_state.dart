part of "content_bloc.dart";

@immutable
sealed class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object?> get props => [];
}

class CatalogInitialState extends ContentState {}

class CatalogLoadingState extends ContentState {}

class CatalogLoadedState extends ContentState {
  final List<CatalogEntity> category;
  final List<String> banner;

  const CatalogLoadedState(this.category, this.banner);

  @override
  List<Object?> get props => [category, banner];
}

class CatalogEmptyState extends ContentState {
  final String message;

  const CatalogEmptyState(this.message);

  @override
  List<Object?> get props => [message];
}

class CatalogErrorState extends ContentState {
  final String message;

  const CatalogErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
