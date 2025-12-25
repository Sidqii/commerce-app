part of 'browse_bloc.dart';

sealed class BrowseState extends Equatable {
  const BrowseState();

  @override
  List<Object?> get props => [];
}

class BrowseInitialState extends BrowseState {}

class BrowseLoadingState extends BrowseState {
  final String? category;
  final String? keyword;

  const BrowseLoadingState(this.category, this.keyword);

  @override
  List<Object?> get props => [category, keyword];
}

class BrowseLoadedState extends BrowseState {
  // TODO: UPDATE
  final List<CatalogEntity> catalog;
  final int page;
  final bool? isloadmore;
  final bool ismaximal;
  final String? category;
  final String? keyword;

  const BrowseLoadedState({
    this.catalog = const [],
    this.page = 1,
    this.isloadmore = false,
    this.ismaximal = false,
    this.category,
    this.keyword,
  });

  BrowseLoadedState copyWith({
    final List<CatalogEntity>? catalog,
    final int? page,
    final bool? isloadmore,
    final bool? ismaximal,
    final String? category,
    final String? keyword,
  }) {
    return BrowseLoadedState(
      catalog: catalog ?? this.catalog,
      page: page ?? this.page,
      isloadmore: isloadmore ?? this.isloadmore,
      ismaximal: ismaximal ?? this.ismaximal,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  List<Object?> get props => [
    catalog,
    page,
    isloadmore,
    ismaximal,
    category,
    keyword,
  ];
}

class BrowseEmptyState extends BrowseState {
  final String? category;
  final String? keyword;

  const BrowseEmptyState(this.category, this.keyword);

  @override
  List<Object?> get props => [category, keyword];
}

class BrowseErrorState extends BrowseState {
  final String? category;
  final String? keyword;
  final String message;

  const BrowseErrorState({this.message = '', this.category, this.keyword});

  @override
  List<Object?> get props => [message];
}
