import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';

class SearchAutocomplete extends StatefulWidget {
  const SearchAutocomplete({super.key});

  @override
  State<SearchAutocomplete> createState() => _SearchAutocompleteState();
}

class _SearchAutocompleteState extends State<SearchAutocomplete> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _focusNode.requestFocus(),
    );

    _controller = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (value) {
                context.read<SearchCubit>().setKeyword(value);
              },
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _controller.clear();
                      context.read<SearchCubit>().clearKeyword();
                      return;
                    }

                    FocusScope.of(context).unfocus();
                    context.pop();
                  },
                  icon: Icon(Icons.clear),
                ),
                hintText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onSubmitted: (value) {
                final keyword = value.trim();

                if (keyword.isEmpty) return;

                context.pushNamed(
                  'browse_result',
                  queryParameters: {'keyword': keyword},
                );
              },
            ),
          ),
        ),

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
    );
  }
}
