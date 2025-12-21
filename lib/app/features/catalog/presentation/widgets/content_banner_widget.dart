part of 'content_view_page.dart';

class ContentBannerWidget extends StatelessWidget {
  final List<String>? imageUrl;
  final String? titleBanner;
  final String? subtitleBanner;
  final String? buttonTitle;

  const ContentBannerWidget({
    super.key,
    required this.imageUrl,
    this.titleBanner,
    this.subtitleBanner,
    this.buttonTitle,
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
        child: ImageContentHandler(imageUrl: '>>(._.)<<'),
      );
    }

    return SliverToBoxAdapter(
      child: Padding(
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
                    return ImageContentHandler(imageUrl: imageUrl![index]);
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
                          : 'Lihat promo menarik lainnya!',
                      style: title,
                    ),
      
                    const SizedBox(height: 4),
      
                    Text(
                      (subtitleBanner?.isNotEmpty ?? false)
                          ? subtitleBanner!
                          : 'Syarat dan ketentuan berlaku',
                      style: subtitle,
                    ),
      
                    const SizedBox(height: 10),
      
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: Text(
                        (buttonTitle?.isNotEmpty ?? false)
                            ? buttonTitle!
                            : 'Lihat Promo',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
