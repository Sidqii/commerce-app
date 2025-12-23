import 'package:suaka_niaga/app/features/catalog/domain/entities/catalog_entity.dart';

class CatalogModel extends CatalogEntity {
  CatalogModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.rating,
    required super.stock,
    required super.brand,
    required super.discount,
    required super.image,
    required super.thumbnail,
  });

  CatalogEntity toEntity() {
    return CatalogEntity(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      rating: rating,
      stock: stock,
      brand: brand,
      discount: discount,
      image: image,
      thumbnail: thumbnail,
    );
  }

  factory CatalogModel.fromJson(Map<String, dynamic> json) {
    return CatalogModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      discount: json['discount'] ?? 0,
      image: (json['images'] as List?)?.whereType<String>().toList() ?? [],
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
