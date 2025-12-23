import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/utils/components/loading_linear_indicator.dart';

import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:suaka_niaga/app/features/browse/presentation/widgets/browse_content_grid.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BrowseBloc, BrowseState>(
          builder: (context, state) {
            if (state is BrowseInitialState) {
              return const LoadingLinearIndicator();
            }

            if (state is BrowseLoadedState) {
              return Stack(
                children: [
                  BrowseContentGrid(product: state.catalog),

                  if (state.isloading)
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: LoadingLinearIndicator(),
                    ),
                ],
              );
            }

            if (state is BrowseLoadedState && state.error != null) {
              return Center(child: Text(state.error!));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
