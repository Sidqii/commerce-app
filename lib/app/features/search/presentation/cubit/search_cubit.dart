import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/search_repository.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/storage_repository.dart';
import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repository;
  final StorageRepository storage;
  Timer? _debounce;

  SearchCubit(this.repository, this.storage)
    : super(SearchState(storage: storage.load()));

  // ngetik
  Future<void> setKeyword(String value) async {
    _debounce?.cancel();

    if (value.trim().isEmpty) {
      clearKeyword();
      return;
    }

    emit(state.copyWith(keyword: value));

    _debounce = Timer(const Duration(milliseconds: 100), () {
      if (value.length >= 3) {
        _fetchSuggestion(value);
      }
    });
  }

  // fetching data
  Future<void> _fetchSuggestion(String keyword) async {
    try {
      final result = await repository.fetchRepository(keyword);

      if (state.keyword != keyword) return;

      final normalize = keyword.toLowerCase();

      final filtering = result.where((element) {
        return element.title.toLowerCase().contains(normalize);
      }).toList();

      if (filtering.isEmpty) {
        emit(state.copyWith(autocomplete: [], status: SearchStatus.empty));
        return;
      }

      emit(
        state.copyWith(autocomplete: filtering, status: SearchStatus.loaded),
      );
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.error, keyword: keyword));
    }
  }

  // bersihin keyboard
  void clearKeyword() {
    emit(
      state.copyWith(
        autocomplete: const [],
        keyword: '',
        status: SearchStatus.idle,
      ),
    );
  }

  // tap autocomplete
  void selectKeyword(String keyword) async {
    final history = List<String>.from(state.storage);

    history.remove(keyword);

    history.insert(0, keyword);

    if (history.length > 5) {
      history.removeRange(5, history.length);
    }

    await storage.save(keyword);

    emit(
      state.copyWith(
        keyword: keyword,
        autocomplete: const [],
        storage: history,
      ),
    );
  }
}
