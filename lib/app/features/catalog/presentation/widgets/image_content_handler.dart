import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:suaka_niaga/app/features/catalog/presentation/utils/url_image_validation.dart';

class ImageContentHandler extends StatelessWidget {
  final String imageUrl;

  const ImageContentHandler({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    isInvalid(imageUrl);

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,

      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: Duration.zero,

      errorWidget: (context, url, error) => _placeholder(),
      progressIndicatorBuilder: (context, url, progress) {
        return const Center(child: CircularProgressIndicator(strokeWidth: 1));
      },
    );
  }

  Widget _placeholder() {
    return Center(
      child: Icon(
        Icons.image_not_supported,
        color: Colors.grey.shade400,
        size: 35,
      ),
    );
  }
}
