import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/domain/usecases/search_query_usecase.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchQueryUsecase searchQueryUsecase;

  SearchBloc({required this.searchQueryUsecase}) : super(SearchInitialState()) {
    on<SearchKeywordEvent>(_onKeywordEvent);
    on<SearchSubmitEvent>(_onSubmitEvent);
  }

  Future<void> _onKeywordEvent(
    SearchKeywordEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchKeywordState(event.keyword));
  }

  Future<void> _onSubmitEvent(
    SearchSubmitEvent event,
    Emitter<SearchState> emit,
  ) async {
    final keyword = event.keyword.trim();

    if (keyword.isEmpty) {
      emit(const SearchEmptyState('Cari produk!'));
      return;
    }

    emit(const SearchLoadingState());

    try {
      final result = await searchQueryUsecase(keyword);

      if (result.isEmpty) {
        emit(SearchEmptyState('$keyword tidak ditemukan'));
        return;
      }

      emit(SearchDataState(result));
    } catch (e) {
      emit(SearchErrorState('Error: $e'));
    }
  }
}
