import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/app/utils/components/loading_linear_indicator.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/bloc/content_bloc.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/widgets/content_view_page.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/widgets/search_initial_bar.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return const LoadingLinearIndicator();
                    }

                    if (state is CatalogEmptyState) {
                      return Center(child: Text(state.message));
                    }

                    if (state is CatalogLoadedState) {
                      return CardScreenPage(
                        category: state.category,
                        banner: state.banner,
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
