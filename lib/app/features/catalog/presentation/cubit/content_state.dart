part of 'content_cubit.dart';

class ContentState extends Equatable {
  final String? error;
  final List<String> banners;
  final List<ProductsEntity> products;
  final List<CategoryEntity> categories;
  final int page;
  final bool hasMore;
  final bool isFetching;

  const ContentState({
    this.error,
    this.banners = const [],
    this.products = const [],
    this.categories = const [],
    this.page = 1,
    this.isFetching = false,
    this.hasMore = true,
  });

  ContentState copyWith({
    final String? error,
    final List<String>? banners,
    final List<ProductsEntity>? products,
    final List<CategoryEntity>? categories,
    final int? page,
    final bool? hasMore,
    final bool? isFetching,
  }) {
    return ContentState(
      error: error,
      banners: banners ?? this.banners,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isFetching: isFetching ?? this.isFetching,
    );
  }

  @override
  List<Object?> get props => [
    error,
    banners,
    products,
    categories,
    page,
    hasMore,
    isFetching,
  ];
}
