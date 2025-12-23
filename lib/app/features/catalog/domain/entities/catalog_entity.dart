class CatalogEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final int stock;
  final String brand;
  final double discount;
  final List<String> image;
  final String thumbnail;

  const CatalogEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.discount,
    required this.image,
    required this.thumbnail,
  });
}
