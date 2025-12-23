import 'package:equatable/equatable.dart';
import 'package:suaka_niaga/app/features/testing/domain/entities/testing_entity.dart';

abstract class TestingState extends Equatable {
  const TestingState();

  @override
  List<Object?> get props => [];
}

class TestingInitialState extends TestingState {}

class TestingLoadingState extends TestingState {}

class TestingLoadedState extends TestingState {
  final List<TestingEntity> testEntity;

  const TestingLoadedState(this.testEntity);

  @override
  List<Object?> get props => [testEntity];
}

class TestingErrorState extends TestingState {
  final String error;

  const TestingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
