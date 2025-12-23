import 'package:equatable/equatable.dart';

abstract class TestingEvent extends Equatable {
  const TestingEvent();

  @override
  List<Object?> get props => [];
}

class TestingInitialEvent extends TestingEvent {}
