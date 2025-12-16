import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/bloc/content_bloc.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/widgets/card_screen_page.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/widgets/search_initial_bar.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5), // TODO: IMPLEMENTASI DI THEME
      body: SafeArea(
        child: Column(
          children: [
            // SEARCH BAR
            SearchInitialBar(
              onFocus: () {
                context.pushNamed(
                  'catalog_search',
                  queryParameters: {'keyword': ''},
                );
              },
            ),

            // MAIN CONTENT
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => FocusScope.of(context).unfocus(),

                child: BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                    if (state is CatalogLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ), // TODO: IMPLEMENT SHIMMER LOADING
                      );
                    }

                    if (state is CatalogEmptyState) {
                      return const Center(child: Text('Tidak ada data'));
                    }

                    if (state is CatalogDataState) {
                      return CardScreenPage(
                        catalog: state.catalog,
                        category: state.category,
                        banners: state.banners,
                      );
                    }

                    if (state is CatalogErrorState) {
                      return Center(child: Text(state.message));
                    }

                    return const Center(child: Text('404 error not found'));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
