import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/domain/entities/autocomplete_entity.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_repository.dart';
import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repository;
  Timer? _debounce;

  SearchCubit(this.repository) : super(SearchState());

  // ngetik
  Future<void> setKeyword(String value) async {
    _debounce?.cancel();

    if (value.trim().isEmpty) {
      emit(const SearchState());
      return;
    }

    emit(state.copyWith(keyword: value, status: SearchStatus.loading));

    _debounce = Timer(const Duration(milliseconds: 300), () {
      _fetchSuggestion(value);
    });
  }

  // fetching data
  Future<void> _fetchSuggestion(String keyword) async {
    try {
      final result = await repository.fetchRepository(keyword);

      if (result.isEmpty) {
        emit(state.copyWith(autocomplete: [], status: SearchStatus.empty));
      } else {
        emit(state.copyWith(autocomplete: result, status: SearchStatus.loaded));
      }
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.error, keyword: keyword));
    }
  }

  // bersihin keyboard
  void clearKeyword() {
    emit(const SearchState());
  }

  // tap autocomplete
  void selectSuggestions(AutocompleteEntity autocomplete) {
    emit(
      state.copyWith(
        keyword: autocomplete.title,
        autocomplete: const [],
        status: SearchStatus.idle,
      ),
    );
  }
}