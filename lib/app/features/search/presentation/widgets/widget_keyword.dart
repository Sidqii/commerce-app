import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

class WidgetKeyword extends StatelessWidget {
  final List<CatalogEntity> autocomplete;

  const WidgetKeyword({
    super.key,
    required this.autocomplete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: autocomplete.length,
      itemBuilder: (context, index) {
        final item = autocomplete[index];
        final word = item.title;

        return ListTile(
          title: Text(item.title),
          onTap: () {
            context.pushNamed(
              'browse_result',
              queryParameters: {'keyword': word},
            );
          },
        );
      },
    );
  }
}
