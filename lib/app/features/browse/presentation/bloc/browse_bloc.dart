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
  }

  Future<void> _onFetchEvent(
    BrowseFetchEvent event,
    Emitter<BrowseState> emit,
  ) async {
    emit(BrowseLoadingState(event.category, event.keyword));

    try {
      final result = await repository.fetchBrowseRepository(
        page: 1,
        keyword: event.keyword,
        category: event.category,
      );

      if (result.isEmpty) {
        emit(BrowseEmptyState(event.category, event.keyword));
        return;
      }

      emit(
        BrowseLoadedState(
          catalog: result,
          page: 1,
          category: event.category,
          keyword: event.keyword,
          ismaximal: result.length < BrowseDatasourceImpl.pageSize,
        ),
      );
    } catch (e) {
      emit(BrowseErrorState(message: e.toString()));
      return;
    }
  }

  Future<void> _onLoadMore(
    BrowseLoadEvent event,
    Emitter<BrowseState> emit,
  ) async {
    final current = state;

    if (current is! BrowseLoadedState) return;

    if (current.ismaximal) return;

    emit(current.copyWith(isloadmore: true));

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
          ismaximal: result.length < BrowseDatasourceImpl.pageSize,
          isloadmore: false,
        ),
      );
    } catch (e) {
      emit(current.copyWith(isloadmore: false));
    }
  }
}
