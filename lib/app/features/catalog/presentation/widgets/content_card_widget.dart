part of 'content_view_page.dart';

class ContentCardWidget extends StatelessWidget {
  final List<ProductsEntity> entity;
  final List<CategoryEntity> categories;

  const ContentCardWidget({
    super.key,
    required this.entity,
    required this.categories,
  });

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

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          final products = entity[index];
          final category = categories[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          // CONTENT IMAGE
                          Positioned.fill(
                            child: ImageContentHandler(
                              imageUrl: compressImageUrl(category.media),
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
                                Text(
                                  category.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: title,
                                ),

                                Text(
                                  '${products.soldOut} produk terjual',
                                  style: subtitle,
                                ),

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
                                  onPressed: () {
                                    context.pushNamed(
                                      'browse_result',
                                      queryParameters: {
                                        'category': category.name,
                                      },
                                    );
                                  },
                                  child: const Text('Cek produk lainnya'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }, childCount: categories.length),
        gridDelegate: AppGridDelegate.catalogGrid,
      ),
    );
  }
}
