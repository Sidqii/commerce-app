import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:suaka_niaga/app/features/search/presentation/bloc/search_bloc.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_keyword.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_suggestion.dart';

class SearchSuggestionBar extends StatefulWidget {
  final String? initialKeyword;

  const SearchSuggestionBar({super.key, required this.initialKeyword});

  @override
  State<SearchSuggestionBar> createState() => _SearchSuggestionBarState();
}

class _SearchSuggestionBarState extends State<SearchSuggestionBar> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _focusNode.requestFocus(),
    );

    _controller = TextEditingController(text: widget.initialKeyword ?? '');

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
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: (value) {
                      context.read<SearchBloc>().add(SearchKeywordEvent(value));
                    },
                    decoration: InputDecoration(
                      isDense: true,
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

              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchKeywordState) {
                      return WidgetKeyword(keyword: state.keyword);
                    }

                    return WidgetSuggestion();
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
