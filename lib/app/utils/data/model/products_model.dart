import 'package:flutter/material.dart';
import 'package:suaka_niaga/app/utils/data/entities/products_entity.dart';

@immutable
class ProductsModel extends ProductsEntity {
  const ProductsModel({
    required super.id,
    required super.name,
    required super.price,
    required super.discount,
    required super.slug,
    required super.category,
    required super.brand,
    required super.vendor,
    required super.rating,
    required super.soldOut,
    required super.stock,
    required super.description,
    required super.specs,
    required super.highlights,
    required super.media,
  });

  ProductsEntity toEntity() {
    return ProductsEntity(
      id: id,
      name: name,
      price: price,
      discount: discount,
      slug: slug,
      category: category,
      brand: brand,
      vendor: vendor,
      rating: rating,
      soldOut: soldOut,
      stock: stock,
      description: description,
      specs: specs,
      highlights: highlights,
      media: media,
    );
  }

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['pricing']?['price'] ?? 0,
      discount: json['pricing']?['discount'] ?? 0,
      slug: json['slug'] ?? '',
      category: json['category']?['name'] ?? '',
      brand: json['brand']?['name'] ?? '',
      vendor: json['vendor']?['name'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      soldOut: json['sold'] ?? '',
      stock: json['stock'] ?? '',
      description: json['description'] ?? '',

      //nested object:
      specs: Map<String, String>.from(json['specs'] ?? {}),
      highlights: List<String>.from(json['highlights']),
      media: List<String>.from(json['media']),
    );
  }
}
