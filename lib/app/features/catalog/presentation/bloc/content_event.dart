part of 'content_bloc.dart';

@immutable
sealed class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object?> get props => [];
}

class CatalogFetchEvent extends ContentEvent {}
