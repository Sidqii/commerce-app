import 'package:go_router/go_router.dart';
import 'package:suaka_niaga/app/features/browse/presentation/pages/app_browse_initial.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/pages/app_catalog_initial.dart';
import 'package:suaka_niaga/app/features/search/presentation/pages/app_seacrh_initial.dart';

final catalogRoute = GoRoute(
  path: '/catalog',
  name: 'catalog',
  builder: (context, state) => const AppCatalogInitial(),
  routes: [
    GoRoute(
      path: 'search',
      name: 'catalog_search',
      builder: (context, state) {
        return AppSeacrhInitial();
      },
    ),

    GoRoute(
      path: 'browse',
      name: 'browse_result',
      builder: (context, state) {
        final keyword = state.uri.queryParameters['keyword'] ?? '';
        final category = state.uri.queryParameters['category'] ?? '';

        return AppBrowseInitial(category: category, keyword: keyword);
      },
    ),
  ],
);
