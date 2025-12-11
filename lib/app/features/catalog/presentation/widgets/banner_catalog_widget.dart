import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerCatalogWidget extends StatelessWidget {
  final List<String>? imageUrl;
  final String? titleBanner;
  final String? subtitleBanner;

  const BannerCatalogWidget({
    super.key,
    required this.imageUrl,
    this.titleBanner,
    this.subtitleBanner,
  });

  @override
  Widget build(BuildContext context) {
    final title = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    final subtitle = TextStyle(color: Colors.grey.shade100, fontSize: 14);

    if (imageUrl == null || imageUrl!.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: _buildImage('>>(._.)<<'),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Stack(
          children: [
            // IMAGE BANNER
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PageView.builder(
                itemCount: imageUrl!.length,
                itemBuilder: (context, index) {
                  return _buildImage(imageUrl![index]);
                },
              ),
            ),

            // GRADIENT OVERLAY
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ),
            ),

            // TEXT + BUTTON
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    (titleBanner?.isNotEmpty ?? false)
                        ? titleBanner!
                        : 'Ini merupakan title pada banner!',
                    style: title,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    (subtitleBanner?.isNotEmpty ?? false)
                        ? subtitleBanner!
                        : 'Bagian ini subtitle pada banner',
                    style: subtitle,
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text('Lihat Promo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.isEmpty) return _placeHolder();

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: Duration.zero,
      errorWidget: (context, url, error) {
        return _placeHolder();
      },
      progressIndicatorBuilder: (context, url, progress) {
        // TODO: LOADING PAKAI SHIMMER
        return const Center(child: CircularProgressIndicator(strokeWidth: 1));
      },
    );
  }

  Widget _placeHolder() {
    return const Center(
      child: Icon(
        Icons.image_not_supported_outlined,
        color: Colors.red,
        size: 100,
      ),
    );
  }
}
