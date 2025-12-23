import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/testing/domain/repositories/testing_repositories.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_event.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_state.dart';

class TestingBloc extends Bloc<TestingEvent, TestingState> {
  final TestingRepositories repositories;

  TestingBloc(this.repositories) : super(TestingInitialState()) {
    on<TestingInitialEvent>((event, emit) async {
      emit(TestingLoadingState());

      try {
        final result = await repositories.fetchTestingRepositories();

        if (result.isEmpty) {
          emit(TestingErrorState('Data kosong'));
          return;
        }

        emit(TestingLoadedState(result));
      } catch (e) {
        emit(TestingErrorState(e.toString()));
      }
    });
  }
}
