part of 'content_view_page.dart';

class ContentCardWidget extends StatelessWidget {
  final CatalogEntity category;

  const ContentCardWidget({super.key, required this.category});

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

    return SizedBox(
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
                    imageUrl: compressImageUrl(category.thumbnail),
                  ),
                ),

                // GRADIENT CONTENT
                AppContentGradient(),

                // TEXT + BUTTON
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.category,
                        overflow: TextOverflow.ellipsis,
                        style: title,
                      ),

                      Text('${category.rating} rating produk', style: subtitle),

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
                            queryParameters: {'category': category.category},
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
    );
  }
}
