import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/search_suggestion_bar.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

class AppSeacrhInitial extends StatelessWidget {
  final String initialKeyword;

  const AppSeacrhInitial({super.key, required this.initialKeyword});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: SearchSuggestionBar(initialKeyword: initialKeyword),
    );
  }
}
