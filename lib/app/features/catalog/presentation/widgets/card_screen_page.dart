import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/compress_image_url.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/widgets/banner_catalog_widget.dart';

part 'card_content_handler.dart';

class CardScreenPage extends StatelessWidget {
  final List<ProductsEntity> catalog;
  final List<String> banners;

  const CardScreenPage({
    super.key,
    required this.catalog,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Bersihin page nya
    final category = <String, ProductsEntity>{};

    for (var product in catalog) {
      category.putIfAbsent(product.category, () => product);
    }

    final categories = category.values.toList();

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        // banner
        SliverToBoxAdapter(child: BannerCatalogWidget(imageUrl: banners)),

        // grid view product
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = catalog[index];

              final image = item.media[0];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //image
                  CardContentHandler(
                    imageUrl: compressImageUrl(image),
                    category: item.category,
                    entity: item,
                  ),
                ],
              );
            }, childCount: categories.length),

            gridDelegate: AppGridDelegate.catalogGrid,
          ),
        ),

        //footer
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Center(
              child: Text(
                "Semua produk sudah ditampilkan",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
