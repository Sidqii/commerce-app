part of "content_bloc.dart";

@immutable
sealed class ContentState extends Equatable {
  const ContentState();
}

class CatalogInitialState extends ContentState {
  const CatalogInitialState();

  @override
  List<Object?> get props => [];
}

class CatalogLoadingState extends ContentState {
  const CatalogLoadingState();

  @override
  List<Object?> get props => [];
}

class CatalogDataState extends ContentState {
  final List<ProductsEntity> catalog;
  final List<CategoryEntity> category;
  final List<String> banners;

  const CatalogDataState({
    required this.catalog,
    required this.category,
    required this.banners,
  });

  @override
  List<Object?> get props => [catalog, category, banners];
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
