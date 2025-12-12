import 'package:flutter/material.dart';

import 'package:suaka_niaga/app/utils/router/app_router.dart';

import 'package:suaka_niaga/app/utils/theme/no_glow_behavior.dart';

import 'package:suaka_niaga/injection/app_root_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: NoGlowBehavior(),
      routerConfig: appRouter,
    );
  }
}
