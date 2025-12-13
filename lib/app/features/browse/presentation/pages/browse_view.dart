import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5), // TODO: IMPLEMENTASI DI THEME
      body: SafeArea(
        child: BlocBuilder<BrowseBloc, BrowseState>(
          builder: (context, state) {
            if (state is BrowseLoadingState) {
              // TODO: IMPLEMENT METHOD
            }

            if (state is BrowseEmptyState) {
              // TODO: IMPLEMENT METHOD
            }

            if (state is BrowseLoadedState) {
              // TODO: IMPLEMENT METHOD
            }

            if (state is BrowseErrorState) {
              // TODO: IMPLEMENT METHOD
            }

            return Container();
          },
        ),
      ),
    );
  }
}
