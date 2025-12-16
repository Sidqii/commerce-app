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
        final keyword = state.uri.queryParameters['keyword'] ?? '';

        return AppSeacrhInitial(initialKeyword: keyword);
      },
    ),

    GoRoute(
      path: 'browse',
      name: 'browse_result',
      builder: (context, state) {
        final keyword = state.uri.queryParameters['keyword'] ?? '';
        //TODO: IMPLEMENT ANOTHER FEATURES

        return AppBrowseInitial(keyword: keyword);
        // TODO: CATCH FEATURES
      },
    ),
  ],
);
