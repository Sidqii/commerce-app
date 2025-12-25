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
            if (state is BrowseLoadingState) {
              return const LoadingLinearIndicator();
            }

            if (state is BrowseEmptyState) {
              return Center(
                child: Text(
                  state.keyword != null
                      ? '${state.keyword} kosong'
                      : 'Data kosong',
                ),
              );
            }

            if (state is BrowseLoadedState) {
              return Stack(
                children: [
                  if (state.isloadmore!)
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LoadingLinearIndicator(),
                    ),

                  BrowseContentGrid(product: state.catalog),
                ],
              );
            }

            if (state is BrowseErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.message),

                    const SizedBox(height: 12),

                    ElevatedButton(
                      onPressed: () {
                        context.read<BrowseBloc>().add(
                          BrowseFetchEvent(state.category, state.keyword),
                        );
                      },
                      child: const Text('coba lagi'),
                    ),
                  ],
                ),
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
