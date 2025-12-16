import 'package:flutter/material.dart';
import 'package:suaka_niaga/app/features/search/presentation/widgets/widget_suggestion.dart';

class WidgetKeyword extends StatelessWidget {
  final String keyword;

  const WidgetKeyword({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    if (keyword.isEmpty) {
      return const WidgetSuggestion();
    }

    final List<String> suggestions = [
      '$keyword Official',
      '$keyword Murah',
      '$keyword Baru',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text('Pencarian $keyword'),
        ),

        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index]),
                onTap: () {
                  // NANTI:
                  // context.read<SearchBloc>().add(
                  //   SearchSelectedEvent(
                  //     keyword: keyword,
                  //     modifierIndex: index,
                  //   ),
                  // );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
