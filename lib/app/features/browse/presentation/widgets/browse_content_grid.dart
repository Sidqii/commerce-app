import 'package:flutter/material.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

class BrowseContentGrid extends StatelessWidget {
  final List<ProductsEntity> product;

  const BrowseContentGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      gridDelegate: AppGridDelegate.catalogGrid,
      itemCount: product.length,
      itemBuilder: (context, index) {
        final item = product[index];

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(color: Colors.grey.shade300)),

              const SizedBox(height: 8),

              Text(item.name),

              const SizedBox(height: 4),

              Text(item.price.toString()),
            ],
          ),
        );
      },
    );
  }
}
