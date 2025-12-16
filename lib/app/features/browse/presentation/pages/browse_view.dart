import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/widgets/browse_content_grid.dart';

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
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 1),
              );
            }

            if (state is BrowseEmptyState) {
              return Center(child: Text(state.message));
            }

            if (state is BrowseLoadedState) {
              return BrowseContentGrid(product: state.entity);
            }

            if (state is BrowseErrorState) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
