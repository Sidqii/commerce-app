part of 'browse_bloc.dart';

sealed class BrowseState extends Equatable {
  const BrowseState();
}

class BrowseInitialState extends BrowseState {
  const BrowseInitialState();

  @override
  List<Object?> get props => [];
}

class BrowseLoadingState extends BrowseState {
  const BrowseLoadingState();

  @override
  List<Object?> get props => [];
}

class BrowseLoadedState extends BrowseState {
  final List<ProductsEntity> entity;

  const BrowseLoadedState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class BrowseEmptyState extends BrowseState {
  final String message;

  const BrowseEmptyState(this.message);

  @override
  List<Object?> get props => [message];
}

class BrowseErrorState extends BrowseState {
  final String message;

  const BrowseErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
