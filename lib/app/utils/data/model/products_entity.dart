class CatalogEntity {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int stocks;
  final String brand;

  const CatalogEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.stocks,
    required this.brand,
  });
}
