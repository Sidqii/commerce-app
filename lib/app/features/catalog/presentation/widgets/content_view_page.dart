import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_handler.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_compresser.dart';

import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

part 'content_banner_widget.dart';
part 'content_card_widget.dart';

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
  final ValueNotifier<bool> isOverScroll = ValueNotifier(false);

  void _handleScroll(ScrollNotification notification) {
    final overNotif = notification is OverscrollNotification;

    if (overNotif && notification.overscroll > 0) {
      if (!isOverScroll.value) {
        isOverScroll.value = true;
      }

      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          isOverScroll.value = false;
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
          ContentBannerWidget(imageUrl: widget.banners),

          // GRID VIEW CONTENT
          ContentCardWidget(
            entity: widget.catalog,
            categories: widget.category,
          ),

          // FOOTER
          ValueListenableBuilder(
            valueListenable: isOverScroll,
            builder: (context, value, child) {
              if (!value) return const SliverToBoxAdapter(child: SizedBox());

              return SliverToBoxAdapter(
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: Text(
                      'Tidak ada produk lainnya',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
