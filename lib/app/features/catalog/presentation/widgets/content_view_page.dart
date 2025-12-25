import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';

import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_content_gradient.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_handler.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_compresser.dart';

part 'content_banner_widget.dart';
part 'content_card_widget.dart';

class ContentViewPage extends StatefulWidget {
  final List<CatalogEntity> category;
  final List<String> banner;

  const ContentViewPage({
    super.key,
    required this.category,
    required this.banner,
  });

  @override
  State<ContentViewPage> createState() => _ContentViewPageState();
}

class _ContentViewPageState extends State<ContentViewPage> {
  final ValueNotifier<bool> isOverScroll = ValueNotifier(false);

  void handleScroll(ScrollNotification notification) {
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
  void dispose() {
    isOverScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        handleScroll(notification);

        return false;
      },
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          // BANNER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ContentBannerWidget(imageUrl: widget.banner),
            ),
          ),

          // GRID VIEW CONTENT
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            sliver: SliverGrid.builder(
              itemCount: widget.category.length,
              gridDelegate: AppGridDelegate.catalogGrid,
              itemBuilder: (context, index) {
                final products = widget.category[index];

                return ContentCardWidget(category: products);
              },
            ),
          ),

          // FOOTER
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: isOverScroll,
              builder: (context, value, child) {
                if (!value) return SizedBox.shrink();

                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Tidak ada produk lainnya',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
