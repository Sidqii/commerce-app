part of 'browse_bloc.dart';

sealed class BrowseState extends Equatable {
  const BrowseState();

  @override
  List<Object?> get props => [];
}

class BrowseInitialState extends BrowseState {}

class BrowseLoadedState extends BrowseState {
  final List<CatalogEntity> catalog;
  final int page;
  final bool isloading;
  final bool ismaximal;
  final String? category;
  final String? keyword;
  final String? error;

  const BrowseLoadedState({
    this.catalog = const [],
    this.page = 1,
    this.isloading = false,
    this.ismaximal = false,
    this.category,
    this.keyword,
    this.error,
  });

  BrowseLoadedState copyWith({
    final List<CatalogEntity>? catalog,
    final int? page,
    final bool? isloading,
    final bool? ismaximal,
    final String? category,
    final String? keyword,
    final String? error,
  }) {
    return BrowseLoadedState(
      catalog: catalog ?? this.catalog,
      page: page ?? this.page,
      isloading: isloading ?? this.isloading,
      ismaximal: ismaximal ?? this.ismaximal,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    catalog,
    page,
    isloading,
    ismaximal,
    category,
    keyword,
    error,
  ];
}
