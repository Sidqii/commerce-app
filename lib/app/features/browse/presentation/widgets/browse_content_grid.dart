import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suaka_niaga/app/utils/data/entities/catalog_entity.dart';
import 'package:suaka_niaga/app/utils/components/loading_linear_indicator.dart';

import 'package:suaka_niaga/app/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_handler.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_compresser.dart';

class BrowseContentGrid extends StatefulWidget {
  final List<CatalogEntity> product;
  final bool isloadmore;
  final bool ismaximal;

  const BrowseContentGrid({
    super.key,
    required this.product,
    required this.ismaximal,
    required this.isloadmore,
  });

  @override
  State<BrowseContentGrid> createState() => _BrowseContentGridState();
}

class _BrowseContentGridState extends State<BrowseContentGrid> {
  static const title = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 20,
  );

  static const subtitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 12,
  );

  final ValueNotifier<bool> isoverscroll = ValueNotifier(false);

  void _pagination(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final pixels = notification.metrics.pixels;
      final maximals = notification.metrics.maxScrollExtent;
      final viewports = notification.metrics.viewportDimension;

      final treshold = maximals - (viewports * 0.2);

      if (pixels >= treshold && !widget.isloadmore && !widget.ismaximal) {
        context.read<BrowseBloc>().add(BrowseLoadEvent());
      }
    }

    final pullover = notification is OverscrollNotification;
    var maximal = widget.ismaximal && !widget.isloadmore;
    var showing = isoverscroll.value;

    if (pullover && notification.overscroll > 0 && maximal && !showing) {
      isoverscroll.value = true;

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          isoverscroll.value = false;
        }
      });
    }
  }

  @override
  void dispose() {
    isoverscroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width * 0.43;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _pagination(notification);

        return false;
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: AppGridDelegate.catalogGrid,
              delegate: SliverChildBuilderDelegate((context, index) {
                final products = widget.product[index];

                final imageUrl = products.image.isNotEmpty
                    ? compressImageUrl(products.image.first)
                    : 'bla bla bla';

                return SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ImageContentHandler(imageUrl: imageUrl),
                            ),

                            // GRADIENT CONTENT
                            Positioned.fill(
                              child: IgnorePointer(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // TEXT + BUTTON
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: itemWidth,
                                    child: Text(
                                      products.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: title,
                                    ),
                                  ),

                                  Text(products.brand, style: subtitle),

                                  const SizedBox(height: 5),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      visualDensity: VisualDensity.compact,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 0,
                                      ),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                    ),
                                    onPressed: () {},
                                    child: const Text('Selengkapnya'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: widget.product.length),
            ),
          ),

          if (widget.isloadmore)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Center(
                  child: LoadingLinearIndicator(width: double.infinity),
                ),
              ),
            ),

          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: isoverscroll,
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
