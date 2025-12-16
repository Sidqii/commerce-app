import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/widgets/browse_content_grid.dart';
import 'package:suaka_niaga/app/utils/widgets/linear_loading_indicator.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BrowseBloc, BrowseState>(
          builder: (context, state) {
            if (state is BrowseLoadingState) {
              return const LinearLoadingIndicator();
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
