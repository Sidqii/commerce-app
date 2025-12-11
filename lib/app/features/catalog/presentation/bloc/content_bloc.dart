import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/catalog/domain/usecases/fetch_banner_usecase.dart';
import 'package:suaka_niaga/app/features/catalog/domain/usecases/fetch_content_usecase.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final FetchCatalogUsecase usecasesFetchCatalog;
  final FetchBannerUsecase usecasesFetchBanner;

  ContentBloc({
    required this.usecasesFetchCatalog,
    required this.usecasesFetchBanner,
  }) : super(CatalogInitialState()) {
    on<CatalogFetchEvent>(_onFetchEvent);
  }

  Future<void> _onFetchEvent(
    CatalogFetchEvent event,
    Emitter<ContentState> emit,
  ) async {
    emit(CatalogLoadingState());

    try {
      final catalog = await usecasesFetchCatalog();

      final banner = await usecasesFetchBanner();


      if (catalog.isEmpty) {
        emit(CatalogEmptyState('Catalog kosong'));
        return;
      }

      if (banner.isEmpty) {
        emit(CatalogEmptyState('Banner kosong'));
        return;
      }

      emit(
        CatalogDataState(catalog: catalog, banners: banner),
      );
    } catch (e) {
      emit(CatalogErrorState('Error: $e'));
    }
  }
}
