import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/app/features/browse/domain/usecases/browse_fetch_usecase.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

part 'browse_event.dart';
part 'browse_state.dart';


class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  final BrowseFetchUsecase onFetchUsecase;

  BrowseBloc({required this.onFetchUsecase})
    : super(const BrowseInitialState()) {
    on<BrowseFetchEvent>(_onFetchCase);
  }

  Future<void> _onFetchCase(
    BrowseFetchEvent event,
    Emitter<BrowseState> emit,
  ) async {
    emit(BrowseLoadingState());

    try {
      final data = await onFetchUsecase(
        keyword: event.keyword,
        category: event.category,
        maximal: event.maximal,
        minimal: event.minimal,
        page: event.page,
      );

      if (data.isEmpty) {
        emit(BrowseEmptyState('Data kosong'));
        return;
      }

      emit(BrowseLoadedState(data));
    } catch (e) {
      emit(BrowseErrorState('Error: $e'));
    }
  }
}
