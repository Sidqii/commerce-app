import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/search_suggestion_bar.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_keyword.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_suggestion.dart';
import 'package:suaka_niaga/app/utils/widgets/linear_loading_indicator.dart';

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
            children: [
              const SearchSuggestionBar(),

              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case SearchStatus.idle:
                        return const WidgetSuggestion();

                      case SearchStatus.loading:
                        return const LinearLoadingIndicator();

                      case SearchStatus.loaded:
                        return WidgetKeyword(autocomplete: state.autocomplete);

                      case SearchStatus.empty:
                        return Center(child: Text('${state.keyword} gada'));

                      case SearchStatus.error:
                        return const Center(child: Text('404 Error not found'));
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
