import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:suaka_niaga/app/features/search/presentation/cubit/search_cubit.dart';

class WidgetSuggestion extends StatelessWidget {
  final List<String> suggestion;

  const WidgetSuggestion({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        final keyword = suggestion[index];

        return ListTile(
          title: Text(keyword),
          onTap: () {
            context.read<SearchCubit>().selectKeyword(keyword);

            context.pushNamed(
              'browse_result',
              queryParameters: {'keyword': keyword},
            );
          },
        );
      },
    );
  }
}
