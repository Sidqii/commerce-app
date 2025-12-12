import 'package:go_router/go_router.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/pages/cataloge_page.dart';
import 'package:suaka_niaga/app/features/search/presentation/pages/search_suggestion_page.dart';

final catalogRoute = GoRoute(
  path: '/catalog',
  name: 'catalog',
  builder: (context, state) => const CatalogePage(),
  routes: [
    GoRoute(
      path: 'search',
      name: 'catalog_search',
      builder: (context, state) {
        final keyword = state.uri.queryParameters['keyword'] ?? '';

        return SearchSuggestionPage(initialKeyword: keyword);
      },
    ),
  ],
);
