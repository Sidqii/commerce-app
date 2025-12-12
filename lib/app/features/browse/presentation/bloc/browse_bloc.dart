import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/browse/domain/usecases/browse_fetch_usecase.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_event.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_state.dart';

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
      final data = await onFetchUsecase();

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
