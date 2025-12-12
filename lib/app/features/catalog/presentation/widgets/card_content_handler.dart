part of 'card_screen_page.dart';

class CardContentHandler extends StatelessWidget {
  final ProductsEntity entity;
  final String category;
  final String imageUrl;

  const CardContentHandler({
    super.key,
    required this.entity,
    required this.category,
    required this.imageUrl,
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

    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                // CONTENT IMAGE
                Positioned.fill(child: ImageContentHandler(imageUrl: imageUrl)),

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
                        category,
                        overflow: TextOverflow.ellipsis,
                        style: title,
                      ),

                      Text(entity.brand, style: subtitle),

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
