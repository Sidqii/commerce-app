import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';
import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

part 'content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  final ContentRepository repository;

  ContentCubit(this.repository) : super(ContentState());

  Future<void> fetchInitial() async {
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true, page: 1, error: null));

    try {
      final products = await repository.fetchCatalogRepository();

      final category = await repository.fetchCategoryRepository();

      final banner = await repository.fetchBannerRepository();

      emit(
        state.copyWith(
          products: products,
          categories: category,
          banners: banner,
          isFetching: false,
          hasMore: products.length == 10,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isFetching: false, error: e.toString()));
    }
  }

  Future<void> loadMore() async {
    if (state.isFetching || !state.hasMore) return;

    final nextPage = state.page + 1;

    emit(state.copyWith(isFetching: true));

    try {
      final products = await repository.fetchCatalogRepository();

      emit(
        state.copyWith(
          page: nextPage,
          products: [...state.products, ...products],
          isFetching: false,
          hasMore: products.length == 10,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isFetching: false, error: e.toString()));
    }
  }
}
