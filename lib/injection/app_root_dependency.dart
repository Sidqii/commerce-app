import 'package:get_it/get_it.dart';
import 'package:suaka_niaga/injection/browse_dependency.dart';

import 'package:suaka_niaga/injection/network_dependency.dart';
import 'package:suaka_niaga/injection/catalog_dependency.dart';
import 'package:suaka_niaga/injection/search_dependency.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // NETWORK ENV
  sl.registerNetwork();

  // CATALOG DEPENDENCY
  sl.registerCatalog();
  sl.registerSearch();
  sl.registerBrowse();
}
