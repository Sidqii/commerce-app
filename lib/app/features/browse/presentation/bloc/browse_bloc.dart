import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/browse/data/datasource/browse_datasource_impl.dart';
import 'package:suaka_niaga/app/features/browse/domain/repositories/browse_repository.dart';

import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

part 'browse_event.dart';
part 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  final BrowseRepository repository;

  BrowseBloc(this.repository) : super(BrowseInitialState()) {
    on<BrowseFetchEvent>(_onFetchEvent);
    on<BrowseLoadEvent>(_onLoadMore);
    on<BrowseFilterEvent>(_onFilterEvent);
    on<BrowseRetryEvent>(_onRetryEvent);
  }

  Future<void> _onFetchEvent(
    BrowseFetchEvent event,
    Emitter<BrowseState> emit,
  ) async {
    emit(const BrowseLoadedState(isloading: true));

    try {
      final result = await repository.fetchBrowseRepository(page: 1);

      emit(
        BrowseLoadedState(
          catalog: result,
          page: 1,
          isloading: false,
          ismaximal: result.length < BrowseDatasourceImpl.pageSize,
        ),
      );
    } catch (e) {
      emit(BrowseLoadedState(isloading: false, error: e.toString()));
    }
  }

  Future<void> _onLoadMore(
    BrowseLoadEvent event,
    Emitter<BrowseState> emit,
  ) async {
    final current = state;

    if (current is! BrowseLoadedState) return;

    if (current.isloading || current.ismaximal) return;

    emit(current.copyWith(isloading: true));

    final nextPage = current.page + 1;

    try {
      final result = await repository.fetchBrowseRepository(
        page: nextPage,
        category: current.category,
        keyword: current.keyword,
      );

      emit(
        current.copyWith(
          catalog: [...current.catalog, ...result],
          page: nextPage,
          isloading: false,
          ismaximal: result.length < BrowseDatasourceImpl.pageSize,
        ),
      );
    } catch (e) {
      emit(current.copyWith(isloading: false, error: e.toString()));
    }
  }

  Future<void> _onFilterEvent(
    BrowseFilterEvent event,
    Emitter<BrowseState> emit,
  ) async {
    emit(
      BrowseLoadedState(
        isloading: true,
        category: event.category,
        keyword: event.keyword,
      ),
    );

    try {
      final result = await repository.fetchBrowseRepository(
        page: 1,
        category: event.category,
        keyword: event.keyword,
      );

      emit(
        BrowseLoadedState(
          catalog: result,
          page: 1,
          isloading: false,
          ismaximal: result.length < BrowseDatasourceImpl.pageSize,
          category: event.category,
          keyword: event.keyword,
        ),
      );
    } catch (e) {
      emit(
        BrowseLoadedState(
          isloading: false,
          error: e.toString(),
          category: event.category,
          keyword: event.keyword,
        ),
      );
    }
  }

  Future<void> _onRetryEvent(
    BrowseRetryEvent event,
    Emitter<BrowseState> emit,
  ) async {
    if (state is! BrowseLoadedState) return;

    final current = state as BrowseLoadedState;

    emit(current.copyWith(isloading: true, error: null));

    try {
      final result = await repository.fetchBrowseRepository(
        page: current.page,
        category: current.category,
        keyword: current.keyword,
      );

      emit(
        current.copyWith(
          catalog: result,
          isloading: false,
          ismaximal: result.length < BrowseDatasourceImpl.pageSize,
        ),
      );
    } catch (e) {
      emit(current.copyWith(isloading: false, error: e.toString()));
    }
  }
}
