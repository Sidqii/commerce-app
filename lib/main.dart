import 'package:flutter/material.dart';

import 'package:suaka_niaga/injection/app_root_dependency.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/pages/cataloge_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CatalogePage());
  }
}
