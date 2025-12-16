import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/pages/browse_view.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

class AppBrowseInitial extends StatelessWidget {
  final String? keyword;
  final String? category;
  final String? sorting;
  final int? maximal;
  final int? minimal;
  final int? page;

  const AppBrowseInitial({
    super.key,
    this.keyword,
    this.category,
    this.sorting,
    this.maximal,
    this.minimal,
    this.page = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<BrowseBloc>()..add(
          BrowseFetchEvent(keyword: keyword, category: category),
        );
      },
      child: BrowseView(),
    );
  }
}
