import 'package:flutter/material.dart';
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

          child: SearchAutocomplete()
        ),
      ),
    );
  }
}
