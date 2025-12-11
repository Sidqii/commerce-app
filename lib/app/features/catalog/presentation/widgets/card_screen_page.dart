import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';

import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/compress_image_url.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/widgets/banner_catalog_widget.dart';

part 'card_content_handler.dart';

class CardScreenPage extends StatefulWidget {
  final List<ProductsEntity> catalog;
  final List<CategoryEntity> category;
  final List<String> banners;

  const CardScreenPage({
    super.key,
    required this.catalog,
    required this.category,
    required this.banners,
  });

  @override
  State<CardScreenPage> createState() => _CardScreenPageState();
}

class _CardScreenPageState extends State<CardScreenPage> {
  bool isOverScroll = false;

  void _handleScroll(ScrollNotification notification) {
    final overNotif = notification is OverscrollNotification;

    if (overNotif && notification.overscroll > 0) {
      if (!isOverScroll) {
        setState(() {
          isOverScroll = true;
        });
      }

      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            isOverScroll = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _handleScroll(notification);

        return false;
      },
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          // BANNER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: BannerCatalogWidget(imageUrl: widget.banners),
            ),
          ),

          // GRID VIEW CONTENT
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = widget.catalog[index];
                final category = widget.category[index];

                final image = category.media;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // CONTENT IMAGE
                    CardContentHandler(
                      imageUrl: compressImageUrl(image),
                      category: category.name,
                      entity: item,
                    ),
                  ],
                );
              }, childCount: widget.category.length),

              gridDelegate: AppGridDelegate.catalogGrid,
            ),
          ),

          // FOOTER
          if (isOverScroll)
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
      ),
    );
  }
}
