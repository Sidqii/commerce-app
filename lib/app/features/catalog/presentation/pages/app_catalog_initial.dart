import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/injection/app_root_dependency.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/bloc/content_bloc.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/pages/catalog_view.dart';

class AppCatalogInitial extends StatelessWidget {
  const AppCatalogInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ContentBloc>()..add(CatalogFetchEvent()),
      child: const CatalogView(),
    );
  }
}
