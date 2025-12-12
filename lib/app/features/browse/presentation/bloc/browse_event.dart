import 'package:equatable/equatable.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

sealed class BrowseEvent extends Equatable {
  const BrowseEvent();
}

class BrowseFetchEvent extends BrowseEvent {
  final ProductsEntity entity;

  const BrowseFetchEvent(this.entity);

  @override
  List<Object?> get props => [entity];
}
