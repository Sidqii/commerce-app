import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';
import 'package:suaka_niaga/app/features/search/presentation/pages/search_view.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

class AppSeacrhInitial extends StatelessWidget {
  const AppSeacrhInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: SearchView(),
    );
  }
}
