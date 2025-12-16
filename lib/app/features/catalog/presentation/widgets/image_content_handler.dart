import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:suaka_niaga/app/utils/widgets/shimmer_loading_box.dart';
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
        return const ShimmerLoadingBox(
          width: double.infinity,
          height: double.infinity,
        );
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
