import 'package:flutter/material.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/app_grid_delegate.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_handler.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/image_content_compresser.dart';

class BrowseContentGrid extends StatelessWidget {
  final List<ProductsEntity> product;

  const BrowseContentGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final title = const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 20,
    );

    final subtitle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 12,
    );

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      gridDelegate: AppGridDelegate.catalogGrid,
      itemCount: product.length,
      itemBuilder: (context, index) {
        final item = product[index];

        return SizedBox(
          height: 250,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ImageContentHandler(
                        imageUrl: compressImageUrl(item.media.first),
                      ),
                    ),

                    // GRADIENT CONTENT
                    Positioned.fill(
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black],
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
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                              style: title,
                            ),
                          ),

                          Text(item.brand, style: subtitle),

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
      },
    );
  }
}
