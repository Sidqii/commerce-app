part of 'content_bloc.dart';

@immutable
sealed class ContentEvent extends Equatable {
  const ContentEvent();
}

class CatalogFetchEvent extends ContentEvent {
  const CatalogFetchEvent();

  @override
  List<Object?> get props => [];
}
