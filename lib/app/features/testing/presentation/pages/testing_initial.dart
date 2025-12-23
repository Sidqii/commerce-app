import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_bloc.dart';
import 'package:suaka_niaga/app/features/testing/presentation/bloc/testing_event.dart';
import 'package:suaka_niaga/app/features/testing/presentation/pages/testing_view.dart';
import 'package:suaka_niaga/injection/app_root_dependency.dart';

class TestingInitial extends StatelessWidget {
  const TestingInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TestingBloc>()..add(TestingInitialEvent()),
      child: TestingView(),
    );
  }
}
