import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/search_autocomplete.dart';

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
              SearchAutocomplete(),

              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.keyword.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text('Pencarian terakhir'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Pencarian ${state.keyword}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
