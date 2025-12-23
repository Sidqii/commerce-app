import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/app/features/catalog/domain/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepository repository;

  ContentBloc(this.repository) : super(CatalogInitialState()) {
    on<CatalogFetchEvent>((event, emit) async {
      emit(CatalogLoadingState());

      try {
        final category = await repository.getCategoryRepository();

        final banner = await repository.getBannerRepository();

        if (category.isEmpty) {
          emit(CatalogEmptyState('Category is empty'));
          return;
        }

        if (banner.isEmpty) {
          emit(CatalogEmptyState('Banner is empty'));
          return;
        }

        emit(CatalogLoadedState(category, banner));
      } catch (e) {
        emit(CatalogErrorState('Error: $e'));
      }
    });
  }
}
