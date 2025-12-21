import 'package:suaka_niaga/app/utils/data/model/products_entity.dart';

class CatalogModel extends CatalogEntity {
  const CatalogModel({
    required super.id,
    required super.title,
    required super.price,
    required super.rating,
    required super.stocks,
    required super.brand,
    required super.description,
  });

  CatalogEntity toEntity() {
    return CatalogModel(
      id: id,
      title: title,
      price: price,
      rating: rating,
      stocks: stocks,
      brand: brand,
      description: description,
    );
  }

  factory CatalogModel.fromJson(Map<String, dynamic> json) {
    return CatalogModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      stocks: json['stocks'],
      brand: json['brand'],
      description: json['description'],
    );
  }
}
