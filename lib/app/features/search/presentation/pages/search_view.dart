import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/app/utils/components/loading_linear_indicator.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';

import 'package:suaka_niaga/app/features/search/presentation/widgets/search_keyword_bar.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_autocomplete.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_suggestion.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchKeywordBar(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<SearchCubit, SearchState>(
                  buildWhen: (previous, current) {
                    return previous.keyword != current.keyword;
                  },

                  builder: (context, state) {
                    if (state.keyword.isEmpty) {
                      return const Text('Pencarian terakhir');
                    }

                    return Text('Pencarian ${state.keyword}');
                  },
                ),
              ),

              const SizedBox(height: 5),

              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  buildWhen: (previous, current) {
                    return previous.status != current.status;
                  },

                  builder: (context, state) {
                    switch (state.status) {
                      case SearchStatus.idle:
                        return const WidgetSuggestion();

                      case SearchStatus.loading:
                        return const LoadingLinearIndicator();

                      case SearchStatus.loaded:
                        return WidgetAutocomplete(
                          autocomplete: state.autocomplete,
                        );

                      case SearchStatus.empty:
                        return Center(child: Text('${state.keyword} kosong'));

                      case SearchStatus.error:
                        return const Center(child: Text('Terjadi kesalahan'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
