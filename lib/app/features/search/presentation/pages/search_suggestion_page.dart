import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/bloc/search_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/search_initial.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

class SearchSuggestionPage extends StatelessWidget {
  final String initialKeyword;

  const SearchSuggestionPage({super.key, required this.initialKeyword});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: SearchInitial(initialKeyword: initialKeyword),
    );
  }
}
